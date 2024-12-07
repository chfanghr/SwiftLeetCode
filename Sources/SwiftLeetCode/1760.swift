// 1760. Minimum Limit of Balls in a Bag
// https://leetcode.com/problems/minimum-limit-of-balls-in-a-bag/description/

public class MinimumLimitOfBallsInABag {
    public static func minimumSize(_ nums: [Int], _ maxOperations: Int) -> Int {
        var lowerBound = 1
        guard var upperBound = nums.max() else {
            return 0
        }

        while lowerBound < upperBound {
            let mid = (lowerBound + upperBound) / 2

            if Self.minimumNumberOfOperationsToSplitAllBags(nums, mid) <= maxOperations {
                upperBound = mid
            } else {
                lowerBound = mid + 1
            }
        }

        return lowerBound
    }

    // Number of operations to make sure that balls in a certain bag are split
    // into multiple bags where the number of balls are smaller or equal to
    // the penalty in said bags.
    public static func minimumNumberOfOperationsToSplitABag(_ balls: Int, _ penalty: Int) -> Int {
        //var remainingBalls = balls
        //var ops = 0
        //while remainingBalls > penalty {
        //    remainingBalls -= penalty
        //    ops += 1
        //}
        //return ops
        balls / penalty + (balls % penalty == 0 ? -1 : 0)
    }

    public static func minimumNumberOfOperationsToSplitAllBags(_ bags: [Int], _ penalty: Int) -> Int
    {
        bags.map({ minimumNumberOfOperationsToSplitABag($0, penalty) }).reduce(0, +)
    }
}
