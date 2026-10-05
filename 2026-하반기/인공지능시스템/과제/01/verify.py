"""Reproduce the maze searches and SVG figures using only the standard library."""

from collections import deque
from heapq import heappop, heappush
from itertools import count
from pathlib import Path

ROOT = Path(__file__).resolve().parent
START, GOAL = (0, 0), (5, 5)
# V[x] blocks (x,y) <-> (x+1,y); H[y] blocks (x,y) <-> (x,y+1).
V = {0: [5, 1], 1: [4, 1, 0], 2: [5, 4, 2], 3: [3, 1], 4: [4, 2, 1]}
H = {4: [3], 3: [0, 1, 5], 2: [1, 2, 3, 4], 0: [0, 2, 3]}


def neighbors(s):
    x, y = s
    for dx, dy in [(0, 1), (1, 0), (0, -1), (-1, 0)]:
        a, b = x + dx, y + dy
        if not (0 <= a <= 5 and 0 <= b <= 5):
            continue
        if dx and y in V.get(min(x, a), []):
            continue
        if dy and x in H.get(min(y, b), []):
            continue
        yield a, b


def heuristic(s):
    return 10 - s[0] - s[1]


def astar():
    costs, parents, order = {START: 0}, {}, []
    serial = count()
    queue = [(10, next(serial), START)]
    closed = set()
    while queue:
        f, _, s = heappop(queue)
        if s in closed or f != costs[s] + heuristic(s):
            continue
        closed.add(s)
        order.append(s)
        if s == GOAL:
            return costs, parents, order
        for t in neighbors(s):
            g = costs[s] + 1
            if g < costs.get(t, float("inf")):
                costs[t], parents[t] = g, s
                heappush(queue, (g + heuristic(t), next(serial), t))
    raise AssertionError("Goal is unreachable")


def bfs():
    distance, queue = {START: 0}, deque([START])
    while queue:
        s = queue.popleft()
        for t in neighbors(s):
            if t not in distance:
                distance[t] = distance[s] + 1
                queue.append(t)
    return distance


def hill():
    path, costs, parents = [START], {START: 0}, {}
    while True:
        s = path[-1]
        successors = list(neighbors(s))
        for t in successors:
            if t not in costs:
                costs[t], parents[t] = costs[s] + 1, s
        t = min(successors, key=heuristic)
        if heuristic(t) >= heuristic(s):
            return costs, parents, path
        path.append(t)


def svg_file(name, width, height, pieces):
    (ROOT / name).write_text(
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" '
        f'viewBox="0 0 {width} {height}">' + "".join(pieces) + "</svg>", encoding="utf-8"
    )


def tree(name, costs, parents, order, path, mode):
    children = {s: [] for s in costs}
    for s, p in parents.items():
        children[p].append(s)
    positions, leaves = {}, count()

    def layout(s, depth):
        if mode != "hill":
            # Pack subtrees by their occupied columns at each depth.
            packed, right = {}, {}
            roots = []
            for child in children[s]:
                subtree = layout(child, depth + 1)
                left = {}
                for _, (cx, cy) in subtree.items():
                    left[cy] = min(left.get(cy, cx), cx)
                offset = max([right[d] + 122 - left[d] for d in left if d in right] or [0])
                shifted = {n: (cx+offset, cy) for n,(cx,cy) in subtree.items()}
                roots.append(shifted[child][0])
                packed.update(shifted)
                for _, (cx, cy) in shifted.items():
                    right[cy] = max(right.get(cy, cx), cx)
            root = (sum(roots)/len(roots)) if roots else 0
            packed[s] = (root, 52 + depth * 78)
            return packed
        xs = [layout(t, depth + 1) for t in children[s]]
        x = sum(xs) / len(xs) if xs else 66 + next(leaves) * 132
        positions[s] = (x, 52 + depth * 90)
        return x

    if mode == "hill":
        layout(START, 0)
    else:
        positions = layout(START, 0)
    if mode != "hill":
        def compact(s):
            chain = [s]
            while len(children[chain[-1]]) == 1:
                chain.append(children[chain[-1]][0])
            columns = 2
            result = {}
            for i, node in enumerate(chain):
                row, col = divmod(i, columns)
                if row % 2: col = columns-1-col
                result[node] = (col*104, row*96)
            end_x, end_y = result[chain[-1]]
            packed, right, roots = {}, {}, []
            for child in children[chain[-1]]:
                subtree = compact(child)
                left = {}
                for cx, cy in subtree.values(): left[cy] = min(left.get(cy,cx),cx)
                offset = max([right[d]+104-left[d] for d in left if d in right] or [0])
                shifted = {n:(cx+offset,cy) for n,(cx,cy) in subtree.items()}
                roots.append(shifted[child][0]);packed.update(shifted)
                for cx,cy in shifted.values():right[cy]=max(right.get(cy,cx),cx)
            center = sum(roots)/len(roots) if roots else 0
            result.update({n:(cx-center+end_x,cy+end_y+96) for n,(cx,cy) in packed.items()})
            return result
        positions = {s:(x,y+56) for s,(x,y) in compact(START).items()}
    else:
        # Place the initial single-successor chain in one horizontal row.
        chain = [START]
        while len(children[chain[-1]]) == 1:
            chain.append(children[chain[-1]][0])
        branch_x = positions[chain[-1]][0]
        for s, (x, y) in list(positions.items()):
            if s in chain:
                positions[s] = (branch_x - (len(chain)-1-chain.index(s))*132, 52)
            else:
                positions[s] = (x, y-(len(chain)-1)*90)
    shift = 66-min(x for x,y in positions.values())
    positions = {s: (x+shift,y) for s,(x,y) in positions.items()}
    width = max(x for x, y in positions.values()) + 66
    height = max(y for x, y in positions.values()) + 32
    pieces = []
    path_edges = set(zip(path, path[1:]))
    for s, p in parents.items():
        x, y = positions[p]
        a, b = positions[s]
        color = "#2563eb" if (p, s) in path_edges else "#cbd5e1"
        middle = (y + b) / 2
        half_height = 26 if mode == "hill" else 30
        if y == b:
            d = f'M{x+36},{y} H{a-52}' if a > x else f'M{x-52},{y} H{a+36}'
        else:
            d = f'M{x},{y+half_height} C{x},{middle} {a},{middle} {a},{b-half_height}'
        pieces.append(f'<path d="{d}" fill="none" stroke="{color}" stroke-width="2" stroke-linecap="round"/>')
    ranks = {s: i + 1 for i, s in enumerate(order)}
    for s, (x, y) in positions.items():
        fill = "#eff6ff" if s in path else "#ffffff"
        stroke = "#93c5fd" if s in path else "#cbd5e1"
        accent = "#2563eb" if s in path else "#64748b"
        if s == GOAL:
            fill, stroke, accent = "#ecfdf5", "#6ee7b7", "#047857"
        elif mode == "hill" and s == order[-1]:
            fill, stroke, accent = "#fef2f2", "#fca5a5", "#dc2626"
        status = "시작" if s == START else "종료" if s == GOAL else "종료" if mode == "hill" and s == order[-1] else ""
        half_height = 26 if mode == "hill" else 30
        pieces.append(f'<rect x="{x-52}" y="{y-half_height}" width="88" height="{half_height*2}" rx="5" fill="{fill}" stroke="{accent if status else stroke}" stroke-width="{2 if status else 1}"/>')
        badge_x = x-52
        if s in ranks or status:
            badge_width = (23 if ranks.get(s, 0) >= 10 else 16) + (22 if status else 0)
            badge_top = y-half_height-20
            pieces.append(f'<rect x="{badge_x}" y="{badge_top}" width="{badge_width}" height="16" rx="4" fill="{accent}"/>')
            label = (str(ranks[s]) if s in ranks else '') + (f'  {status}' if status else '')
            pieces.append(f'<text x="{badge_x+5}" y="{badge_top+12}" font-family="Noto Sans KR" font-size="10" font-weight="bold" fill="white">{label}</text>')
        # Arial at 10px: the widest label, '(x,y)', occupies about 23px.
        # Center the entire 45px maze + 9px gap + 23px text group.
        left, top, cell = x - 46.5, y - 22.5, 7.5
        def point(t):
            return left + (t[0]+0.5)*cell, top + (5.5-t[1])*cell
        pieces.append(f'<rect x="{left}" y="{top}" width="45" height="45" fill="white" stroke="#334155" stroke-width="0.9"/>')
        for i in range(1,6):
            pieces.append(f'<path d="M{left+i*cell},{top} v45 M{left},{top+i*cell} h45" stroke="#e2e8f0" stroke-width="0.4"/>')
        for vx, ys in V.items():
            for vy in ys:
                px, py = point((vx,vy))
                pieces.append(f'<path d="M{px+cell/2},{py-cell/2} v{cell}" stroke="#334155" stroke-width="0.9"/>')
        for hy, xs in H.items():
            for hx in xs:
                px, py = point((hx,hy))
                pieces.append(f'<path d="M{px-cell/2},{py-cell/2} h{cell}" stroke="#334155" stroke-width="0.9"/>')
        route = [s]
        while route[-1] in parents:
            route.append(parents[route[-1]])
        route.reverse()
        assert len(route)-1 == costs[s]
        assert all(b in list(neighbors(a)) for a,b in zip(route,route[1:]))
        points = " ".join(f"{px},{py}" for px,py in map(point,route))
        pieces.append(f'<polyline points="{points}" fill="none" stroke="#2563eb" stroke-width="1.4" stroke-linejoin="round"/>')
        px, py = point(START)
        pieces.append(f'<circle cx="{px}" cy="{py}" r="1.6" fill="#2563eb"/>')
        px, py = point(GOAL)
        pieces.append(f'<path d="M{px},{py-2} l-2,4 h4 Z" fill="#dc2626"/>')
        px, py = point(s)
        pieces.append(f'<circle cx="{px}" cy="{py}" r="2" fill="{accent}" stroke="white" stroke-width="0.6"/>')
        metrics = [f'({s[0]},{s[1]})', f'g={costs[s]}', f'h\u0302={heuristic(s)}']
        if mode != "hill": metrics.append(f'f\u0302={costs[s]+heuristic(s)}')
        line_gap = 14
        first_baseline = y - (len(metrics)-1)*line_gap/2 + 4
        for i,metric in enumerate(metrics):
            pieces.append(f'<text x="{x+7.5}" y="{first_baseline+i*line_gap}" text-anchor="start" font-family="Arial" font-size="10" fill="#334155">{metric}</text>')
    svg_file(name, width, height, pieces)

def maze(path):
    def point(s):
        return 60 + 50 * s[0], 310 - 50 * s[1]
    pieces = ['<rect x="35" y="35" width="300" height="300" fill="white" stroke="#111827" stroke-width="3"/>']
    for i in range(1, 6):
        a = 35 + i * 50
        pieces += [f'<path d="M{a},35 V335 M35,{a} H335" stroke="#d1d5db" stroke-dasharray="2 3"/>']
    for x, ys in V.items():
        for y in ys:
            a, b = point((x, y))
            pieces.append(f'<path d="M{a+25},{b-25} V{b+25}" stroke="#111827" stroke-width="3"/>')
    for y, xs in H.items():
        for x in xs:
            a, b = point((x, y))
            pieces.append(f'<path d="M{a-25},{b-25} H{a+25}" stroke="#111827" stroke-width="3"/>')
    if path:
        points = " ".join(f"{a},{b}" for a, b in map(point, path))
        pieces.append(f'<polyline points="{points}" fill="none" stroke="#2563eb" stroke-width="4" stroke-linejoin="round"/>')
    for i in range(6):
        a, b = point((i, i))
        pieces += [f'<text x="{a}" y="355" text-anchor="middle" font-family="Arial" font-size="16">{i}</text>',
                   f'<text x="20" y="{b+5}" text-anchor="middle" font-family="Arial" font-size="16">{i}</text>']
    pieces += ['<circle cx="60" cy="310" r="7" fill="#2563eb"/>',
               '<path d="M310,52 L302,68 L318,68 Z" fill="#ea580c"/>']
    svg_file("maze-path.svg" if path else "maze.svg", 370, 370, pieces)


if __name__ == "__main__":
    g, parents, order = astar()
    path = [GOAL]
    while path[-1] != START:
        path.append(parents[path[-1]])
    path.reverse()
    distances = bfs()
    assert distances[GOAL] == g[GOAL] == 12
    assert len(path) - 1 == 12
    assert all(b in list(neighbors(a)) for a, b in zip(path, path[1:]))
    for x in range(6):
        for y in range(6):
            s = (x, y)
            for t in neighbors(s):
                assert s in list(neighbors(t))
                assert heuristic(s) <= 1 + heuristic(t)
    hg, hp, ho = hill()
    assert ho[-1] == (2, 2) and hg[ho[-1]] == 4
    assert all(heuristic(t) > heuristic(ho[-1]) for t in neighbors(ho[-1]))
    tree("hill-tree.svg", hg, hp, ho, ho, "hill")
    tree("astar-tree.svg", g, parents, order, path, "astar")
    maze([])
    maze(path)
    print("BFS/A*: shortest cost = 12; hill stops at (2,2), cost = 4")
    print("A* selection order (goal is selected, not expanded):")
    for i, s in enumerate(order, 1):
        print(i, s, g[s], heuristic(s), g[s] + heuristic(s))
    print("Path:", path)
