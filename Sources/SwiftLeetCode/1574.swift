public class FindLengthOfShortestSubarray {
  public static func findLengthOfShortestSubarray(_ arr: [Int]) -> Int {
    if arr.count == 1 {
      return 0
    }

    var l_seq_end = 0
    var r_seq_start = 0

    for (next_value, (offset, value)) in zip(arr.dropFirst(), arr.enumerated()) {
      if value > next_value {
        l_seq_end = offset
        break
      }
    }

    for (last_value, (offset, value)) in zip(arr.dropLast().reversed(), arr.enumerated().reversed())
    {
      if last_value > value {
        r_seq_start = offset
        break
      }
    }

    if l_seq_end < r_seq_start {
      var min_length = min(arr.count - l_seq_end - 1, r_seq_start)

      for offset_l in arr[0...l_seq_end].indices {
        for offset_r in arr[r_seq_start...].indices {
          if arr[offset_l] <= arr[offset_r] {
            min_length = min(min_length, offset_r - offset_l - 1)
            break
          }
        }
      }

      return min_length
    } else {
      return 0
    }
  }
}
