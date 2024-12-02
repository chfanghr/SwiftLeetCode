public class FirstMissingPositive {
  public static func firstMissingPositive(_ nums: [Int]) -> Int {
    var nums = nums

    for offset in (0..<nums.count) {
      var value = nums[offset]

      while 0 < value && value < nums.count && nums[value - 1] != value {
        nums.swapAt(value - 1, offset)
        value = nums[offset]
      }
    }

    for offset in (0..<nums.count) {
      if nums[offset] != offset + 1 {
        return offset + 1
      }
    }

    return nums.count + 1
  }
}
