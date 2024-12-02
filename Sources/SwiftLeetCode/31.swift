public class NextPermutation {
  public static func nextPermutation(_ nums: inout [Int]) {
    switch nums.count {
    case 0, 1:
      return
    default:
      var pivot_index: Int? = nil

      for i in stride(from: nums.count - 2, through: 0, by: -1) {
        if nums[i] >= nums[i + 1] {
          continue
        }

        pivot_index = i
        break
      }

      guard let pivot_index = pivot_index else {
        nums.reverse()
        return
      }

      let pivot_value = nums[pivot_index]

      for i in stride(from: nums.count - 1, through: 0, by: -1) {
        if nums[i] > pivot_value {
          nums.swapAt(i, pivot_index)
          nums[(pivot_index + 1)...].reverse()
          return
        }
      }
    }
  }
}
