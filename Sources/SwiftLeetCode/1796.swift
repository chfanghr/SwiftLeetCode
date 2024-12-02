public class SecondLargest {
  public static func secondHighest(_ s: String) -> Int {
    let digits = Array(
      Set(
        s
          .compactMap({ $0.wholeNumberValue })
      )
      .sorted()
      .reversed())

    switch digits.count {
    case 0, 1:
      return -1
    default:
      return digits[1]
    }
  }
}
