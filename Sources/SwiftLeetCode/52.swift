public class NQueens2 {
  public static func totalNQueens(_ n: Int) -> Int {
    var stack = [BoardState(n)]
    var count = 0

    while !stack.isEmpty {
      let thisState = stack.removeLast()

      if thisState.queens.count == n {
        count += 1
      } else {
        stack.append(contentsOf: thisState.placeAllPossibleAndAdvance())
      }
    }

    return count
  }

  public struct BoardState {
    public init(_ n: Int) {
      assert(n <= 16)
      self.queens = []
      self.n = n
      self.down = 0
      self.left = 0
      self.right = 0
    }

    private init(queens: [Int], n: Int, down: UInt16, left: UInt16, right: UInt16) {
      self.queens = queens
      self.n = n
      self.down = down
      self.left = left
      self.right = right
    }

    public let queens: [Int]
    public let n: Int
    public let down: UInt16
    public let left: UInt16
    public let right: UInt16

    public func getPlaceablePositions() -> [Int] {
      let allRestrictions = down | left | right
      var mask: UInt16 = 0b1000_0000_0000_0000
      var ret: [Int] = []
      ret.reserveCapacity(n)
      for i in (0..<n) {
        if (mask & allRestrictions) == 0 {
          ret.append(i)
        }
        mask >>= 1
      }
      return ret
    }

    public func place(at pos: Int) -> BoardState {
      let mask: UInt16 = 0b1000_0000_0000_0000 >> pos
      let down = mask | down
      let left = mask | left
      let right = mask | right
      var queens = queens
      queens.append(pos)

      return BoardState(queens: queens, n: n, down: down, left: left, right: right)
    }

    public func placeAllPossibleAndAdvance() -> [BoardState] {
      self.getPlaceablePositions().map({ self.place(at: $0).advance() })
    }

    public func advance() -> BoardState {
      let left = left << 1
      let right = right >> 1
      return BoardState(queens: queens, n: n, down: down, left: left, right: right)
    }

    public func pp() {
      func pad(_ string: String, _ toSize: Int) -> String {
        var padded = string
        for _ in 0..<(toSize - string.count) {
          padded = "0" + padded
        }
        return padded
      }

      print("q", queens)
      print("n", n)
      print("d", pad(String(down, radix: 2), 16))
      print("l", pad(String(left, radix: 2), 16))
      print("r", pad(String(right, radix: 2), 16))
      print("a", pad(String(down | left | right, radix: 2), 16))
    }

    public func visualize() -> [String] {
      var ret = [String]()
      ret.reserveCapacity(queens.count)
      for q in queens {
        var row = [Character]()
        row.reserveCapacity(n)
        for _ in (0..<q) {
          row.append(".")
        }
        row.append("Q")
        for _ in (q + 1..<n) {
          row.append(".")
        }
        ret.append(String(row))
      }
      return ret
    }
  }

}
