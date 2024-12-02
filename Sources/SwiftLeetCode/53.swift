public class MaxSubArray {
    public static func maxSubArray(_ nums: [Int]) -> Int {
        switch nums.count {
        case 0:
            return Int.min
        case 1:
            return nums.first!
        default:
            var max_sum = nums.first!
            var this_sum = nums.first!

            for num in nums.dropFirst() {
                debugPrint(num, this_sum, max_sum)

                this_sum = max(num, num + this_sum)
                max_sum = max(max_sum, this_sum)
            }

            return max_sum
        }
    }
}
