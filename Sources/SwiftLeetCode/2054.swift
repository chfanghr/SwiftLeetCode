// 2054: Two Best Non-Overlapping Events
// https://leetcode.com/problems/two-best-non-overlapping-events/description/

public class TwoBestNonOverlappingEvents {
    public static func maxTwoEvents(_ events: [[Int]]) -> Int {
        let events = events.sorted { $0[0] < $1[0] }

        var suffix = [Int](repeating: 0, count: events.count + 1)
        for (idx, event) in events.enumerated().reversed() {
            suffix[idx] = max(suffix[idx + 1], event[2])
        }
        _ = suffix.popLast()

        var maxValueSum = 0

        for event in events {
            let secondEventMaxValue =
                binarySearch(events) { event[1] < $0[0] }
                .map { suffix[$0] }
                ?? 0
            maxValueSum = max(maxValueSum, event[2] + secondEventMaxValue)
        }

        return maxValueSum
    }

    static func binarySearch<T>(_ arr: [T], _ check: (T) -> Bool) -> Int? {
        if arr.isEmpty {
            return nil
        }
        var lowerBound = 0
        var upperBound = arr.count

        while lowerBound < upperBound {
            let mid = (lowerBound + upperBound) / 2
            if check(arr[mid]) {
                upperBound = mid
            } else {
                lowerBound = mid + 1
            }
        }

        return lowerBound == arr.count ? nil : lowerBound
    }
}
