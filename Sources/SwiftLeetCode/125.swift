public class ValidPalindrome {
  public static func isPalindrome(_ s: String) -> Bool {
    let seq = s.filter({ $0.isLetter || $0.isWholeNumber }).map({ $0.lowercased() })
    return seq.reversed() == seq
  }
}
