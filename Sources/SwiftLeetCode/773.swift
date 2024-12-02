public class SlidingPuzzle {
  struct BoardState {
    let board: [[Int]]
    let stepCount: Int
    let emptyCellPosition: (Int, Int)

    private init(board: [[Int]], stepCount: Int, emptyCellPosition: (Int, Int)) {
      self.board = board
      self.stepCount = stepCount
      self.emptyCellPosition = emptyCellPosition
    }

    init() {
      self.board = [[1, 2, 3], [4, 5, 0]]
      self.stepCount = 0
      self.emptyCellPosition = (1, 2)
    }

    private static func isValidPosition(pos: (Int, Int)) -> Bool {
      let (rowIndex, colIndex) = pos

      return 0 <= rowIndex && rowIndex < 2 && 0 <= colIndex && colIndex < 3
    }

    func nextStates() -> [BoardState] {
      var ret = [BoardState]()
      ret.reserveCapacity(3)

      for (rowOffset, colOffset) in [
        (1, 0), (-1, 0), (0, 1), (0, -1),
      ] {
        let (emptyCellRowIndex, emptyCellColIndex) = self.emptyCellPosition
        let (nextEmptyCellRowIndex, nextEmptyCellColIndex) = (
          emptyCellRowIndex + rowOffset, emptyCellColIndex + colOffset
        )
        guard
          0 <= nextEmptyCellRowIndex && nextEmptyCellRowIndex < 2 && 0 <= nextEmptyCellColIndex
            && nextEmptyCellColIndex < 3
        else {
          continue
        }
        var nextBoard = self.board
        nextBoard[emptyCellRowIndex][emptyCellColIndex] =
          nextBoard[nextEmptyCellRowIndex][nextEmptyCellColIndex]
        nextBoard[nextEmptyCellRowIndex][nextEmptyCellColIndex] = 0
        ret.append(
          BoardState(
            board: nextBoard, stepCount: self.stepCount + 1,
            emptyCellPosition: (nextEmptyCellRowIndex, nextEmptyCellColIndex)))
      }

      return ret
    }
  }

  public static func allBoards() -> [[[Int]]: Int] {
    var stateStack = [BoardState()]
    var boards = [[[Int]]: Int]()

    while !stateStack.isEmpty {
      let thisState = stateStack.popLast()!

      if let stepCount = boards[thisState.board], stepCount < thisState.stepCount {
        continue
      }

      boards[thisState.board] = thisState.stepCount
      stateStack.append(contentsOf: thisState.nextStates())
    }

    return boards
  }

  public static func slidingPuzzle(_ board: [[Int]]) -> Int {
    if let stepCount = Self.allBoards()[board] {
      stepCount
    } else {
      -1
    }
  }
}
