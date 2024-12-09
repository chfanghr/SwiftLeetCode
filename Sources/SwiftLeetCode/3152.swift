// 3152. Special Array II
// https://leetcode.com/problems/special-array-ii/description

public class SpecialArrayII {
    public static func isArraySpecial(_ nums: [Int], _ queries: [[Int]]) -> [Bool] {
        let prevParityDifferent =
            [true]
            + [Bool](
                zip(nums, nums.dropFirst()).map {
                    ($0 + $1) % 2 != 0
                })

        return queries.map {
            prevParityDifferent[$0[0]...$0[1]].dropFirst().reduce(true) { $0 && $1 }
        }
    }
}
