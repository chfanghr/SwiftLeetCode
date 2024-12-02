public class SortCharactersByFrequency {
  public static func frequencySort(_ s: String) -> String {
    return String(
      [Character: Int](
        s.map { ($0, 1) },
        uniquingKeysWith: +
      ).sorted {
        $0.value > $1.value
      }.map {
        [Character](repeating: $0, count: $1)
      }.joined())
  }
}
