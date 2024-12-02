public class TakeKOfEachCharacterFromLeftAndRight {
  public static func takeCharacters(_ s: String, _ k: Int) -> Int {
    let s = [Character](s)

    var characterCountOutsideTheWindow = [0, 0, 0]

    for char in s {
      characterCountOutsideTheWindow[Self.getOffset(char)] += 1
    }

    for count in characterCountOutsideTheWindow {
      if count < k {
        return -1
      }
    }

    var windowMaxLength: Int = 0
    var windowStart = 0

    for windowEnd in s.indices {
      let characterAtWindowEnd = s[windowEnd]
      let offsetOfCharacterAtWindowEnd = Self.getOffset(characterAtWindowEnd)
      characterCountOutsideTheWindow[offsetOfCharacterAtWindowEnd] -= 1

      while characterCountOutsideTheWindow[offsetOfCharacterAtWindowEnd] < k
        && windowStart <= windowEnd
      {
        let offsetOfCharacterAtWindowStart = Self.getOffset(s[windowStart])
        characterCountOutsideTheWindow[offsetOfCharacterAtWindowStart] += 1
        windowStart += 1
      }

      windowMaxLength = max(windowMaxLength, windowEnd - windowStart + 1)
    }

    return s.count - windowMaxLength
  }

  static func getOffset(_ ch: Character) -> Int {
    Int(ch.asciiValue! - ("a" as Character).asciiValue!)
  }
}
