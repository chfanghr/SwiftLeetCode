// 1464. Maximum Product of Two Elements in an Array
// https://leetcode.com/problems/maximum-product-of-two-elements-in-an-array/description

public class MaximumProductOfTwoElementsInAnArray {
    public static func maxProduct(_ nums: [Int]) -> Int {
        var heap = nums.reduce(into: MaxHeap()) { acc, x in
            acc.insert(x)
        }

        let x = heap.extractMax()!
        let y = heap.extractMax()!

        return (x - 1) * (y - 1)
    }
}
