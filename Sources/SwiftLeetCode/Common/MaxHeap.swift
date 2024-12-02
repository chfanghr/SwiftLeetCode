public struct MaxHeap<T: Comparable> {
    private var vals: [T] = []

    public static func parentIdx(of child: Int) -> Int? {
        child == 0 ? nil : (child - 1) / 2
    }

    public static func leftChildIdx(of parent: Int) -> Int {
        parent * 2 + 1
    }

    public static func rightChildIdx(of parent: Int) -> Int {
        parent * 2 + 2
    }

    public init() {}

    private mutating func heapify(at idx: Int) {
        guard self.vals.indices.contains(idx) else {
            return
        }

        var maxIdx = idx

        let leftChildIdx = Self.leftChildIdx(of: idx)
        let rightChildIdx = Self.rightChildIdx(of: idx)

        if self.vals.indices.contains(leftChildIdx)
            && self.vals[leftChildIdx] > self.vals[maxIdx]
        {
            maxIdx = leftChildIdx
        }

        if self.vals.indices.contains(rightChildIdx)
            && self.vals[rightChildIdx] > self.vals[maxIdx]
        {
            maxIdx = rightChildIdx
        }

        guard maxIdx != idx else {
            return
        }

        self.vals.swapAt(idx, maxIdx)
        self.heapify(at: maxIdx)
    }

    private mutating func siftUp(at idx: Int) {
        guard self.vals.indices.contains(idx) else {
            return
        }

        var idx = idx
        while let parentIdx = Self.parentIdx(of: idx) {
            guard self.vals[parentIdx] < self.vals[idx] else {
                break
            }
            self.vals.swapAt(idx, parentIdx)
            idx = parentIdx
        }
    }

    public mutating func insert(_ val: T) {
        let idx = self.vals.endIndex
        self.vals.append(val)
        self.siftUp(at: idx)
    }

    public enum IncreaseKeyError: Error {
        case indexOutOfBound
        case newKeySmallerThanCurrentKey
    }

    public mutating func increaseKey(at idx: Int, to newKey: T) throws {
        guard self.vals.indices.contains(idx) else {
            throw IncreaseKeyError.indexOutOfBound
        }
        let currentKey = self.vals[idx]
        guard newKey > currentKey else {
            throw IncreaseKeyError.newKeySmallerThanCurrentKey
        }
        self.vals[idx] = newKey
        self.siftUp(at: idx)
    }

    public var max: T? {
        self.vals.first
    }

    public mutating func extractMax() -> T? {
        guard !self.vals.isEmpty else {
            return nil
        }

        self.vals.swapAt(0, self.vals.endIndex - 1)
        let max = self.vals.popLast()
        self.heapify(at: 0)
        return max
    }

    public subscript(at idx: Int) -> T {
        self.vals[idx]
    }

    public var indices: Range<Int> {
        self.vals.indices
    }

    public var count: Int {
        self.vals.count
    }

    public var isEmpty: Bool {
        self.vals.isEmpty
    }
}
