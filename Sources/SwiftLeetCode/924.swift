public class FindChampionII {
  public static func findChampion(_ n: Int, _ edges: [[Int]]) -> Int {

    var inDegrees = [Int](repeating: 0, count: n)

    for edge in edges {
      inDegrees[edge[1]] += 1
    }

    let startNodes = inDegrees.enumerated().filter { (_, element) in
      element == 0
    }

    return if startNodes.count == 1 {
      startNodes.first!.offset
    } else {
      -1
    }
  }
}
