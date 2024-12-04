// 2825. Make String a Subsequence Using Cyclic Increments
// https://leetcode.com/problems/make-string-a-subsequence-using-cyclic-increments/description/

public class MakeStringASubsequenceUsingCyclicIncrements {
    public static func cyclicIncrease(_ ch: Character) -> Character {
        if ch == "z" {
            "a"
        } else {
            Character(UnicodeScalar(ch.asciiValue! + 1))
        }
    }

    public static func canMakeSubsequence(_ str1: String, _ str2: String) -> Bool {
        let str1 = [Character](str1)
        let str1CyclicIncreased = str1.map(Self.cyclicIncrease)
        let str2 = [Character](str2)

        var indexInStr1 = 0
        var indexInStr2 = 0

        while indexInStr2 < str2.endIndex && indexInStr1 < str1.endIndex {
            let characterToFind = str2[indexInStr2]
            if str1[indexInStr1] == characterToFind || str1CyclicIncreased[indexInStr1] == characterToFind {
                indexInStr2 += 1
            }
            indexInStr1 += 1
        }

        return indexInStr2 == str2.endIndex
    }
}
