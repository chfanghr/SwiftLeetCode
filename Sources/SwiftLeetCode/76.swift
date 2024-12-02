public class MinimumWindowSubstring {
  public static func minWindow(_ s: String, _ t: String) -> String {
    let tCharMap = [Character: Int](
      t.map { ($0, 1) }, uniquingKeysWith: +
    )
    let currentCharMap = [Character: Int](
      s.filter { tCharMap[$0] != nil }.map { ($0, 1) },
      uniquingKeysWith: +
    )

    if tCharMap.keys.count != currentCharMap.keys.count {
      return ""
    }
    for (char, count) in currentCharMap {
      if tCharMap[char]! > count {
        return ""
      }
    }

    let s = [Character](s)

    let stratA = { () -> (Int, String) in
      var currentCharMap = currentCharMap

      var endOffset = s.count - 1
      var startOffset = 0

      while endOffset > 0 {
        let currentChar = s[endOffset]

        if tCharMap[currentChar] != nil {
          guard currentCharMap[currentChar]! - tCharMap[currentChar]! > 0 else {
            break
          }

          currentCharMap[currentChar]! -= 1
        }

        endOffset -= 1
      }

      while startOffset < s.count {
        let currentChar = s[startOffset]

        if tCharMap[currentChar] != nil {
          guard currentCharMap[currentChar]! - tCharMap[currentChar]! > 0 else {
            break
          }

          currentCharMap[currentChar]! -= 1
        }

        startOffset += 1
      }

      return (endOffset - startOffset + 1, String(s[startOffset...endOffset]))
    }

    let stratB = { () -> (Int, String) in
      var currentCharMap = currentCharMap

      var endOffset = s.count - 1
      var startOffset = 0

      while startOffset < s.count {
        let currentChar = s[startOffset]

        if tCharMap[currentChar] != nil {
          guard currentCharMap[currentChar]! - tCharMap[currentChar]! > 0 else {
            break
          }

          currentCharMap[currentChar]! -= 1
        }

        startOffset += 1
      }

      while endOffset > 0 {
        let currentChar = s[endOffset]

        if tCharMap[currentChar] != nil {
          guard currentCharMap[currentChar]! - tCharMap[currentChar]! > 0 else {
            break
          }

          currentCharMap[currentChar]! -= 1
        }

        endOffset -= 1
      }

      return (endOffset - startOffset + 1, String(s[startOffset...endOffset]))
    }

    let (lengthA, strA) = stratA()
    let (lengthB, strB) = stratB()

    return lengthA > lengthB ? strB : strA
  }
}
