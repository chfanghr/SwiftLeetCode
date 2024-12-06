// 2554. Maximum Number of Integers to Choose From a Range I
// https://leetcode.com/problems/maximum-number-of-integers-to-choose-from-a-range-i/

class MaximumNumberOfIntegersToChooseFromARangeI {
    public static func maxCount(_ banned: [Int], _ n: Int, _ maxSum: Int) -> Int {
        var letsPretendThisIsABitMap = [Bool](repeating: false, count: n + 1)
        for num in banned {
            if num > n {
                continue
            }
            letsPretendThisIsABitMap[num] = true
        }

        var currentSum = 0
        var chosen = 0

        for x in (1...n) {
            if letsPretendThisIsABitMap[x] {
                continue
            }
            currentSum += x
            if currentSum > maxSum {
                break
            }
            chosen += 1
        }

        return chosen
    }
}
