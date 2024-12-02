public class MaxFrequencyElements {
  public static func maxFrequencyElements(_ nums: [Int]) -> Int {
    let freqs = Dictionary(nums.map({ ($0, 1) }), uniquingKeysWith: +).values.sorted().reversed()

    guard let max_freq = freqs.first else {
      return -1
    }

    return freqs.filter({ $0 == max_freq }).count * max_freq
  }
}
