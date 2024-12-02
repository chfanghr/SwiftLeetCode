public class ShortestDistanceAfterRoadAdditionQueriesI {
    public static func shortestDistanceAfterQueries(_ n: Int, _ queries: [[Int]]) -> [Int] {
        var responses: [Int] = .init(repeating: 0, count: queries.count)
        var graph = Graph(n)
        var visited: [Int: Int] = .init()

        for (index, query) in queries.enumerated() {
            graph.addEdge(from: query[0], to: query[1])
            graph.updateVisited(visited: &visited)
            responses[index] = visited[n - 1]!
        }

        return responses
    }

    public struct Graph {
        var edges: [[Bool]]

        init(_ n: Int) {
            edges = .init(repeating: .init(repeating: false, count: n), count: n)

            for i in (0..<n - 1) {
                addEdge(from: i, to: i + 1)
            }
        }

        mutating func addEdge(from: Int, to: Int) {
            self.edges[from][to] = true
        }

        func nextVertices(of vertex: Int) -> [Int] {
            self.edges[vertex].enumerated().filter { $0.element }.map { $0.offset }
        }

        func updateVisited(visited: inout [Int: Int]) {
            var queue: Queue<(vertex: Int, length: Int)> = .init()

            queue.enqueue(val: (vertex: 0, length: 0))

            while let (vertex, length) = queue.dequeue() {
                if let minLength = visited[vertex], minLength < length {
                    continue
                }
                visited[vertex] = length
                for nextVertex in self.nextVertices(of: vertex) {
                    queue.enqueue(val: (vertex: nextVertex, length: length + 1))
                }
            }
        }
    }

    public struct Queue<T> {
        class Node {
            internal init(
                val: T, next: Node? = nil
            ) {
                self.val = val
                self.next = next
            }

            let val: T
            var next: Node?
        }

        private var head: Node?
        private var tail: Node?

        var isEmpty: Bool {
            head == nil
        }

        mutating func enqueue(val: T) {
            let newTail = Node(val: val)
            if head == nil {
                self.head = newTail
                self.tail = newTail
            } else {
                let oldTail = self.tail!
                oldTail.next = newTail
                self.tail = newTail
            }
        }

        mutating func dequeue() -> T? {
            guard let oldHead = self.head else {
                return nil
            }

            self.head = oldHead.next
            if self.head == nil {
                self.tail = nil
            }

            return oldHead.val
        }
    }
}
