struct Stack<T> {
    var vals: [T] = []

    public init(minimumCapacity: Int? = nil) {
        if let minimumCapacity = minimumCapacity{
            self.vals.reserveCapacity(minimumCapacity)
        }
    }

    public mutating func push(_ val: T) {
        self.vals.append(val)
    }

    public var peek: T? {
        self.vals.last
    }

    public mutating func pop() -> T? {
        self.vals.popLast()
    }

    public var count: Int {
        self.vals.count
    }

    public var isEmpty: Bool {
        self.vals.isEmpty
    }
}
