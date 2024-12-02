public class MoveZeros {
    public static func moveZeroes(_ nums: inout [Int]) {
        var next_pos = 0;

        for idx in (0..<nums.count) {
          if nums[idx] != 0 {
            nums[next_pos] = nums[idx]
            next_pos += 1
          }
        }

        for idx in (next_pos..<nums.count) {
          nums[idx] = 0
        }
    }
}