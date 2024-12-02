public class ShortestSubarrayWithSumAtLeastK {
  // https://youtu.be/5AY70aAHZiQ
  public static func shortestSubarray(_ nums: [Int], _ k: Int) -> Int {
    if nums.isEmpty {
      return -1
    }

    var prefix_sums = [Int]()
    prefix_sums.reserveCapacity(nums.count + 1)
    prefix_sums.append(0)

    for num in nums {
      prefix_sums.append(num + prefix_sums.last!)
    }

    print(prefix_sums)

    var offset_queue = [Int]()
    offset_queue.reserveCapacity(nums.count)

    var min_length = nums.count + 1

    for (this_offset, this_sum) in prefix_sums.enumerated() {
      while !offset_queue.isEmpty && this_sum - prefix_sums[offset_queue.first!] >= k {
        min_length = min(this_offset - offset_queue.first!, min_length)
        offset_queue.removeFirst()
      }

      while !offset_queue.isEmpty && prefix_sums[offset_queue.last!] >= this_sum {
        offset_queue.removeLast()
      }

      offset_queue.append(this_offset)
    }

    return min_length > nums.count ? -1 : min_length
  }

  // public struct SegmentTree {
  //   var root: SegmentTreeNode?

  //   public init(_ arr: [Int]) {
  //     self.root = SegmentTreeNode(arr[...])
  //   }

  //   public func query_sum_in_range(_ q_range: Range<Int>) -> Int? {
  //     self.root?.query_sum_in_range(q_range)
  //   }
  // }

  // class SegmentTreeNode {
  //   var sum: Int
  //   var range: Range<Int>

  //   var l, r: SegmentTreeNode?

  //   init?(_ slice: ArraySlice<Int>) {
  //     switch slice.count {
  //     case 0:
  //       return nil
  //     case 1:
  //       self.sum = slice.first!
  //       self.range = slice.indices
  //       self.l = nil
  //       self.r = nil
  //     default:
  //       self.range = slice.indices
  //       let start_index = self.range.startIndex
  //       let end_index = self.range.endIndex
  //       let mid_index = (start_index + end_index) / 2
  //       self.l = .init(slice[start_index..<mid_index])
  //       self.r = .init(slice[mid_index..<end_index])
  //       self.sum = (l?.sum ?? 0) + (r?.sum ?? 0)
  //     }
  //   }

  //   func query_sum_in_range(_ q_range: Range<Int>) -> Int? {
  //     let q_start = q_range.startIndex
  //     let q_end = q_range.endIndex

  //     let start = self.range.startIndex
  //     let end = self.range.endIndex

  //     if q_start < start || end < q_end || q_start == q_end {
  //       return nil
  //     }

  //     if q_start == start && end == q_end {
  //       return self.sum
  //     }

  //     if self.l!.range.endIndex >= q_end {
  //       return self.l!.query_sum_in_range(q_range)
  //     }

  //     if q_start >= self.r!.range.startIndex {
  //       return self.r!.query_sum_in_range(q_range)
  //     }

  //     let sum_left = self.l!.query_sum_in_range(q_start..<self.l!.range.endIndex)!
  //     let sum_right = self.r!.query_sum_in_range(self.r!.range.startIndex..<q_end)!
  //     return sum_left + sum_right

  //   }
  // }
}
