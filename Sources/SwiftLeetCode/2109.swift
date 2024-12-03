// 2109. Adding Spaces to a String
// https://leetcode.com/problems/adding-spaces-to-a-string/description/

public class AddingSpacesToAString {
    public static func addSpaces(_ s: String, _ spaceIndices: [Int]) -> String {
        let s = [Character](s)

        var ret = [Character]()
        ret.reserveCapacity(s.count + spaceIndices.count)
        
        var indexInS = 0
        var indexInSpaceIndices = 0
        
        while indexInS < s.endIndex {
            if indexInSpaceIndices < spaceIndices.endIndex && indexInS == spaceIndices[indexInSpaceIndices] {
                ret.append(" ")
                indexInSpaceIndices += 1
            } else {
                ret.append(s[indexInS])
                indexInS += 1
            }
        }
        
        return String(ret)
    }
}
