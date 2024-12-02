public class GroupAnagrams {
  public static func groupAnagrams(_ strs: [String]) -> [[String]] {
    return [[String]](
      [[Character: Int]: [String]].init(grouping: strs) {
        .init($0.map { ($0, 1) }, uniquingKeysWith: +)
      }.values)
  }
}
