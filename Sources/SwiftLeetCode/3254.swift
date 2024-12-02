public class FindThePowerOfKSizeSubarraysI {
  public static func resultsArray(_ nums: [Int], _ k: Int) -> [Int] {
    var slice_start = 0
    var consecutive_and_ascending_sequence_end: Int? = nil

    var solutions: [Int] = []

    solutions.reserveCapacity(nums.count)

    while true {
      let slice_end = slice_start + k

      if slice_end > nums.count {
        break
      }

      if let last_consecutive_and_ascending_sequence_end = consecutive_and_ascending_sequence_end {
        if last_consecutive_and_ascending_sequence_end <= slice_start {
          consecutive_and_ascending_sequence_end = Self.findConsecutiveAndAscendingSequenceEnd(
            nums[slice_start..<slice_end])
        }
      } else {
        consecutive_and_ascending_sequence_end = Self.findConsecutiveAndAscendingSequenceEnd(
          nums[slice_start..<slice_end])
      }

      if consecutive_and_ascending_sequence_end != nil {
        solutions.append(-1)
      } else {
        solutions.append(nums[slice_end - 1])
      }

      slice_start += 1
    }
    return solutions
  }

  static func findConsecutiveAndAscendingSequenceEnd(_ slice: ArraySlice<Int>) -> Int? {
    for (l_offset, r_offset) in zip(slice.indices, slice.dropFirst().indices) {
      if slice[r_offset] - slice[l_offset] != 1 {
        return l_offset
      }
    }

    return nil
  }

}
