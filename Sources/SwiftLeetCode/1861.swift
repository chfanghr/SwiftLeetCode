public class RotateTheBox {
  public static func rotateTheBox(_ box: [[Character]]) -> [[Character]] {
    let m = box.count
    let n = box.first!.count

    var boxRotated = [[Character]](repeating: [Character](repeating: "-", count: m), count: n)

    for (y, row) in box.enumerated() {
      for (x, cell) in row.enumerated() {
        boxRotated[x][m - y - 1] = cell
      }
    }

    for col in (0..<m) {
      dropColumn(&boxRotated, col)
    }

    return boxRotated
  }

  public static func dropColumn(_ box: inout [[Character]], _ currentColumn: Int) {
    for row in box.indices.reversed().dropFirst() {
      if box[row][currentColumn] == "#" {
        for prevRow in (row + 1..<box.count) {
          if box[prevRow][currentColumn] != "." {
            break
          }

          box[prevRow - 1][currentColumn] = "."
          box[prevRow][currentColumn] = "#"
        }
      }
    }
  }
}
