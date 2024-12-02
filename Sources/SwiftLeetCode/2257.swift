public class CountUnguardedCellsInTheGrid {
  public static func countUnguarded(_ m: Int, _ n: Int, _ guards: [[Int]], _ walls: [[Int]]) -> Int
  {
    var map: [[UInt8]] = .init(repeating: .init(repeating: 0, count: n), count: m)

    for w in walls {
      let row = w[0]
      let col = w[1]

      map[row][col] = 1
    }

    for g in guards {
      let row = g[0]
      let col = g[1]

      map[row][col] = 1
    }

    let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    for g in guards {
      let row = g[0]
      let col = g[1]

      for (rowDelta, colDelta) in dirs {
        var row = row + rowDelta
        var col = col + colDelta

        while 0 <= row && row < m && 0 <= col && col < n {
          if map[row][col] == 1 {
            break
          }

          map[row][col] = 2

          row += rowDelta
          col += colDelta
        }

      }
    }

    return map.reduce(0) { acc, col in
      acc
        + col.reduce(0) { acc, cell in
          if cell == 0 {
            acc + 1
          } else {
            acc
          }
        }
    }
  }
}
