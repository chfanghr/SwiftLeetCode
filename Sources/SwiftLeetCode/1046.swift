// 1046. Last Stone Weight
// https://leetcode.com/problems/last-stone-weight/description

public class LastStoneWeight {
    public static func lastStoneWeight(_ stones: [Int]) -> Int {
        var heap = MaxHeap<Int>()

        for stone in stones {
            heap.insert(stone)
        }

        while !heap.isEmpty {
            let x = heap.extractMax()!
            guard let y = heap.extractMax() else {
                return x
            }
            let newStone = abs(x - y)
            if newStone > 0 {
                heap.insert(newStone)
            }
        }

        return 0
    }
}
