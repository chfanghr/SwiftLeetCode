public class Permutation {
  public static func permute(_ nums: [Int]) -> [[Int]] {
    var stack = [(Set<Int>(), [Int]())]
    var ret = [[Int]]()

    while !stack.isEmpty {
      let (used, sequence) = stack.removeLast()

      if sequence.count == nums.count {
        ret.append(sequence)
      } else {
        for num in nums {
          if !used.contains(num) {
            var used = used
            var sequence = sequence
            used.insert(num)
            sequence.append(num)
            stack.append((used, sequence))
          }
        }
      }
    }

    return ret
  }
}
