public class TwoSum {
  public static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var num_to_index: [Int: Int] = .init(minimumCapacity: nums.count)

    for (this_idx, num) in nums.enumerated() {
      if let that_idx = num_to_index[target - num] {
        return [this_idx, that_idx]
      }
      num_to_index[num] = this_idx
    }

    return []
  }
}
