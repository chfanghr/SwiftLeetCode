public class LargestNumber {
    public static func largestNumber(_ nums: [Int]) -> String {
        let result = nums.map({ String($0) }).sorted(by: { $0 + $1 < $1 + $0 }).reversed().joined()
        if let first_character = result.first {
            if first_character == "0" {
                return "0"
            }
        }
        return result
    }
}
