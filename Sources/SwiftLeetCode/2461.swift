public class MaximumSumOfDistinctSubarraysWithLengthK {
  public static func maximumSubarraySum(_ nums: [Int], _ k: Int) -> Int {
    if nums.count < k || nums.isEmpty {
      fatalError()
    }

    if k == 1 {
      return nums.max() ?? 0
    }

    var prefixSums = [Int]()
    prefixSums.reserveCapacity(nums.count + 1)
    prefixSums.append(0)

    for num in nums {
      prefixSums.append(num + prefixSums.last!)
    }

    var numsInWindow = [Int: Int](nums[0..<k].map { ($0, 1) }, uniquingKeysWith: +)
    var maxSum = numsInWindow.count == k ? prefixSums[k] : 0

    var windowStartOffset = 1
    var lastHeadElem = nums[0]

    while true {
      let windowEndOffset = windowStartOffset + k - 1

      guard windowEndOffset < nums.count else {
        break
      }

      numsInWindow[lastHeadElem]! -= 1
      if numsInWindow[lastHeadElem]! == 0 {
        numsInWindow.removeValue(forKey: lastHeadElem)
      }

      lastHeadElem = nums[windowStartOffset]

      let lastElem = nums[windowEndOffset]

      if let lastElemCount = numsInWindow[lastElem] {
        numsInWindow[lastElem] = lastElemCount + 1
      } else {
        numsInWindow[lastElem] = 1
      }

      if numsInWindow.count == k {
        maxSum = max(maxSum, prefixSums[windowStartOffset + k] - prefixSums[windowStartOffset])
      }

      windowStartOffset += 1
    }

    return maxSum
  }
}
