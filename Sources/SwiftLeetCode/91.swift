public class DecodeWays {
  public func numDecodings(_ s: String) -> Int {
    Self.numDecodings(Substring(s))
  }
  public static func numDecodings(_ s: Substring) -> Int {
    let code_table: [Substring: Int] = [
      "1": 1,
      "2": 1,
      "3": 1,
      "4": 1,
      "5": 1,
      "6": 1,
      "7": 1,
      "8": 1,
      "9": 1,
      "10": 1,
      "11": 2,
      "12": 2,
      "13": 2,
      "14": 2,
      "15": 2,
      "16": 2,
      "17": 2,
      "18": 2,
      "19": 2,
      "20": 1,
      "21": 2,
      "22": 2,
      "23": 2,
      "24": 2,
      "25": 2,
      "26": 2,
    ]
    var cache: [Substring: Int] = code_table

    return Self.numDecodings(s, code_table, &cache)
  }

  static func numDecodings(_ s: Substring, _ predefined_code_table: [Substring: Int], _ cache: inout [Substring: Int]) -> Int {
    if s.isEmpty {
      return 1
    }

    if let ans = cache[s] {
      return ans
    }

    let ans =
      if s.first! == "0" {
        0
      } else {
        Self.numDecodings(s.dropFirst(), predefined_code_table, &cache)
          + (s.count >= 2 && predefined_code_table[(s.prefix(2))] != nil
            ? Self.numDecodings(s.dropFirst().dropFirst(), predefined_code_table, &cache)
            : 0)
      }

    cache[s] = ans

    return ans
  }
}
