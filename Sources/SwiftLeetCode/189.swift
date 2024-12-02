public class RotateArray {
  public static func rotate(_ nums: inout [Int], _ k: Int) {
    if nums.count == 0 || nums.count == 1 || k == 0 {
      return
    }

    let p = nums.count - k % nums.count

    let l = nums[p...]
    let r = nums[..<p]

    nums = Array(l + r)
  }
}
