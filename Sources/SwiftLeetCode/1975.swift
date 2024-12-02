public class MaximumMatrixSum {
  public static func maxMatrixSum(_ matrix: [[Int]]) -> Int {
    if matrix.isEmpty {
      return 0
    }

    var matrix = matrix

    var numberOfNegativeRows = 0
    var minPositivePosition: (Int, Int)? = nil

    for rowIndex in matrix.indices {
      let row = matrix[rowIndex]
      let numberOfNegativeNumbers = row.filter { $0 < 0 }.count
      matrix[rowIndex] = row.map { abs($0) }
      if numberOfNegativeNumbers % 2 != 0 {
        numberOfNegativeRows += 1
      }
      let (minPositiveColIndex, minPositive) = matrix[rowIndex].enumerated().min {
        $0.element < $1.element
      }!
      if let (lastMinPositiveRowIndex, lastMinPositiveColIndex) = minPositivePosition {
        if minPositive < matrix[lastMinPositiveRowIndex][lastMinPositiveColIndex] {
          minPositivePosition = (rowIndex, minPositiveColIndex)
        }
      } else {
        minPositivePosition = (rowIndex, minPositiveColIndex)
      }
    }

    if numberOfNegativeRows % 2 != 0 {
      let (minPositiveRowIndex, minPositiveColIndex) = minPositivePosition!
      matrix[minPositiveRowIndex][minPositiveColIndex] = -matrix[minPositiveRowIndex][
        minPositiveColIndex]
    }

    return matrix.reduce(0, { (acc, col) in acc + col.reduce(0, +) })
  }
}
