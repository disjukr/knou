// BEGIN state
interface State {
  x: number;
  y: number;
}
// END state

// BEGIN endpoints
const initial: State = { x: 0, y: 0 };
const goal: State = { x: 5, y: 5 };
function isGoal(s: State): boolean {
  return s.x === goal.x && s.y === goal.y;
}
// END endpoints

// BEGIN operators
interface Operator {
  dx: number;
  dy: number;
}
const operators: Operator[] = [
  { dx: 0, dy: 1 }, { dx: 1, dy: 0 },
  { dx: 0, dy: -1 }, { dx: -1, dy: 0 },
];

// verticalWalls[x][y]: (x,y)와 (x+1,y) 사이의 벽 유무
const verticalWalls: boolean[][] = [
  [false, true,  false, false, false, true ], // x=0
  [true,  true,  false, false, true,  false], // x=1
  [false, false, true,  false, true,  true ], // x=2
  [false, true,  false, true,  false, false], // x=3
  [false, true,  true,  false, true,  false], // x=4
];

// horizontalWalls[y][x]: (x,y)와 (x,y+1) 사이의 벽 유무
const horizontalWalls: boolean[][] = [
  [true,  false, true,  true,  false, false], // y=0
  [false, false, false, false, false, false], // y=1
  [false, true,  true,  true,  true,  false], // y=2
  [true,  true,  false, false, false, true ], // y=3
  [false, false, false, true,  false, false], // y=4
];

// SPLIT
// 연산자: 상, 우, 하, 좌의 이동 중 가능한 후계 상태를 생성한다.
function successors({ x, y }: State): State[] {
  const result: State[] = [];
  for (const { dx, dy } of operators) {
    const nx = x + dx, ny = y + dy;
    if (nx < 0 || nx > 5 || ny < 0 || ny > 5) continue;
    if (dx && verticalWalls[Math.min(x, nx)][y]) continue;
    if (dy && horizontalWalls[Math.min(y, ny)][x]) continue;
    result.push({ x: nx, y: ny });
  }
  return result;
}

// END operators

// BEGIN space
const stateSpace = new Map<string, State>();
const pending: State[] = [initial];
for (const state of pending) {
  const key = `${state.x},${state.y}`;
  if (stateSpace.has(key)) continue;
  stateSpace.set(key, state);
  pending.push(...successors(state));
}
// 초기상태부터의 유효한 경로에서 각 이동 비용은 1이다.
function pathCost(path: State[]): number {
  return path.length - 1;
}
// END space
