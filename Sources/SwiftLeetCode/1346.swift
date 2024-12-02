public class CheckIfNAndItsDoubleExist {
    public static func checkIfExist(_ arr: [Int]) -> Bool {
        let nums: [Int: Int] = .init(arr.map { ($0, 1) }, uniquingKeysWith: +)

        return arr.first {
            let double = $0 * 2
            guard let count = nums[double] else {
                return false
            }
            return if double == 0 {
                count > 1
            } else {
                true
            }
        } != nil
    }
}
