public class FindLongestSpecialSubstringThatOccursTriceI {
    public static func maximumLength(_ s: String) -> Int {
        var lengthCounts: [Character: [Int: Int]] = [:]

        var idx_l = s.startIndex

        while idx_l < s.endIndex {
            var idx_r = idx_l
            while idx_r < s.endIndex && s[idx_r] == s[idx_l] {
                idx_r = s.index(after: idx_r)
            }

            let ch = s[idx_l];
            if lengthCounts[ch] == nil {
                lengthCounts[ch] = [:]
            }

            updateLengthCounts(&lengthCounts[ch]!, s.distance(from: idx_l, to: idx_r))

            idx_l = idx_r
        }

        return lengthCounts.values.flatMap {
            $0.filter {
                $0.value >= 3
            }.keys
        }.max() ?? -1;
    }

    static func updateLengthCounts(_ dic: inout [Int: Int], _ length: Int){
        for i in 1...length{
            if dic[i] == nil{
                dic[i] = 0
            }
            dic[i]! += length - i + 1
        }
    }
}
