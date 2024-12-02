public class AddStrings {
  public static func addStrings(_ num1_str: String, _ num2_str: String) -> String {
    if num1_str.isEmpty {
      return num2_str
    }

    if num2_str.isEmpty {
      return num1_str
    }

    let max_count = 1 + max(num1_str.count, num2_str.count)

    var num1 = Array(num1_str.map({ $0.wholeNumberValue! }).reversed())
    num1.append(contentsOf: [Int](repeating: 0, count: max_count - num1.count))

    var num2 = Array(num2_str.map({ $0.wholeNumberValue! }).reversed())
    num2.append(contentsOf: [Int](repeating: 0, count: max_count - num2.count))

    assert(num1.count == num2.count && num2.count == max_count)

    var res = [Int](repeating: 0, count: max_count)
    var carry_over = 0

    for (idx, (l, r)) in zip(num1, num2).enumerated() {
      let s = l + r + carry_over

      res[idx] = s % 10
      carry_over = s / 10
    }

    if res.last! == 0 {
      res = res.dropLast()
    }

    return res.reversed().map({ "\($0)" }).joined()
  }
}
