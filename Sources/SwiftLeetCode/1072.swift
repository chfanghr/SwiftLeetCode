public class FlipColumnsForMaximumOfEqualRows {
  static func flipRow(_ row: [Int]) -> [Int] {
    row.map { $0 == 1 ? 0 : 1 }
  }

  public static func maxEqualRowsAfterFlips(_ matrix: [[Int]]) -> Int {
    [[Int]: Int](
      matrix.map { ($0.first! == 0 ? $0 : Self.flipRow($0), 1) }, uniquingKeysWith: +
    ).values.max() ?? 0
  }
}
