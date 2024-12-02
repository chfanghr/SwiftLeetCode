public class NumberToWords {
  public static func numberToWords(_ num: Int) -> String {
    var fragments: [String] = []

    Self.numberToWords(fragments: &fragments, num)

    return fragments.joined(separator: " ")
  }

  static func pow10(_ power: Int) -> Int {
    var answer: Int = 1
    for _ in 0..<power { answer *= 10 }
    return answer
  }

  static func numberToWordsConditional(
    fromExponent: Int, toExponent: Int, suffix: String, fragments: inout [String], _ num: Int
  ) -> Bool {
    if pow10(fromExponent) <= num && num < pow10(toExponent) {
      let denominator = pow10(fromExponent)

      Self.numberToWords(fragments: &fragments, num / denominator)

      fragments.append(suffix)

      let rem = num % denominator
      if rem != 0 {
        Self.numberToWords(fragments: &fragments, rem)
      }

      return true
    } else {
      return false
    }
  }

  static func numberToWords(fragments: inout [String], _ num: Int) {
    switch num {
    case 0: fragments.append("Zero")
    case 1: fragments.append("One")
    case 2: fragments.append("Two")
    case 3: fragments.append("Three")
    case 4: fragments.append("Four")
    case 5: fragments.append("Five")
    case 6: fragments.append("Six")
    case 7: fragments.append("Seven")
    case 8: fragments.append("Eight")
    case 9: fragments.append("Nine")
    case 10: fragments.append("Ten")
    case 11: fragments.append("Eleven")
    case 12: fragments.append("Twelve")
    case 13: fragments.append("Thirteen")
    case 14: fragments.append("Fourteen")
    case 15: fragments.append("Fifteen")
    case 16: fragments.append("Sixteen")
    case 17: fragments.append("Seventeen")
    case 18: fragments.append("Eighteen")
    case 19: fragments.append("Nineteen")
    case 20: fragments.append("Twenty")
    case 30: fragments.append("Thirty")
    case 40: fragments.append("Forty")
    case 50: fragments.append("Fifty")
    case 60: fragments.append("Sixty")
    case 70: fragments.append("Seventy")
    case 80: fragments.append("Eighty")
    case 90: fragments.append("Ninety")

    default:
      if num < 0 {
        fatalError("NEGATIVE")
      } else if num < 100 {
        Self.numberToWords(fragments: &fragments, num / 10 * 10)  // English is weird

        let rem = num % 10
        if rem != 0 {
          Self.numberToWords(fragments: &fragments, rem)
        }
      } else {
        guard
          Self.numberToWordsConditional(
            fromExponent: 2, toExponent: 3, suffix: "Hundred", fragments: &fragments, num)
            || Self.numberToWordsConditional(
              fromExponent: 3, toExponent: 6, suffix: "Thousand", fragments: &fragments, num)
            || Self.numberToWordsConditional(
              fromExponent: 6, toExponent: 9, suffix: "Million", fragments: &fragments, num)
            || Self.numberToWordsConditional(
              fromExponent: 9, toExponent: 12, suffix: "Billion", fragments: &fragments, num)
        else {
          fatalError("TOO BIG")
        }
      }
    }
  }
}
