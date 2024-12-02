public class MinimumDeletions {
  public static func minimumDeletions(_ nums: [Int]) -> Int {
    let indexed_nums = nums.enumerated().sorted(by: { $0.element < $1.element })

    guard let min_elem = indexed_nums.first else {
      return -1
    }

    guard let max_elem = indexed_nums.last else {
      return -1
    }

    let (min_offset, max_offset) =
      if min_elem.offset > max_elem.offset {
        (max_elem.offset, min_elem.offset)
      } else {
        (min_elem.offset, max_elem.offset)
      }

    // strategy 1:
    // delete everything until max_offset

    let strategy_1_deletions = max_offset + 1

    // strategy 2:
    // delete everything before min_offset, and everything after max_offset

    let strategy_2_deletions = min_offset + nums.count - max_offset + 1

    // strategy 3:
    // delete everything from the back
    let strategy_3_deletions = nums.count - min_offset

    return min(min(strategy_1_deletions, strategy_2_deletions), strategy_3_deletions)
  }
}
