public class ClimbingStairs {
  public static func climbStairs(_ n: Int) -> Int {
    var cache = [Int: Int]()
    return Self.climbStairs(n, cache: &cache)
  }

  public static func climbStairs(_ n: Int, cache: inout [Int: Int]) -> Int {
    if let ans = cache[n] {
      return ans
    }

    let ans =
      switch n {
      case 0:
        0
      case 1:
        1
      case 2:
        2
      default:
        Self.climbStairs(n - 1, cache: &cache) + Self.climbStairs(n - 2, cache: &cache)
      }

    cache[n] = ans

    return ans
  }
}
