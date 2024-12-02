public class HouseRobber {
  public static func rob(_ nums: [Int]) -> Int {
    if nums.isEmpty {
      return 0
    }

    var dp = [Int](repeating: 0, count: nums.count + 1)

    dp[0] = 0
    dp[1] = nums [0]

    for i in nums.indices.dropFirst() {
      dp[i + 1] = max(dp[i], nums[i] + dp[i - 1])
    }

    return dp[nums.count]
  }
}
