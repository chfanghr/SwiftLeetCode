// https://www.graph-magics.com/articles/euler.php

public class ValidArrangementOfPairs {
    public static func validArrangement(_ pairs: [[Int]]) -> [[Int]] {
        Self.pathToPairs(Self.dbg(Self.Graph(fromPairs: pairs).eulerianPathOrCircuit!))
    }

    static func pathToPairs(_ path: [Int]) -> [[Int]] {
        zip(path, path.dropFirst()).map {
            [$0.0, $0.1]
        }
    }

    static func dbg<T>(_ val: T) -> T {
        //debugPrint(val)
        return val
    }

    struct Graph {
        var edges: [Int: [Int]] = [:]
        var inDegrees: [Int: Int] = [:]
        var allVertices: Set<Int> = .init()

        public init(fromPairs pairs: [[Int]]) {
            pairs.forEach {
                self.addEdge(from: $0[0], to: $0[1])
            }
        }

        public mutating func addEdge(from: Int, to: Int) {
            if self.edges[from] == nil {
                self.edges[from] = []
            }
            if self.inDegrees[to] == nil {
                self.inDegrees[to] = 0
            }

            self.edges[from]!.append(to)
            self.inDegrees[to]! += 1

            allVertices.insert(from)
            allVertices.insert(to)
        }

        public var outDegrees: [Int: Int] {
            self.edges.mapValues { $0.count }
        }

        public var inAndOutDegrees: [Int: (inDegree: Int, outDegree: Int)] {
            let outDegrees = self.outDegrees
            let inDegrees = self.inDegrees

            return .init(
                uniqueKeysWithValues: self.allVertices.map { vertex in
                    (vertex, (inDegree: inDegrees[vertex] ?? 0, outDegree: outDegrees[vertex] ?? 0))
                })
        }

        public var eulerianPathOrCircuitStartingVertex: Int? {
            let inAndOutDiffs = self.inAndOutDegrees.mapValues {
                $0.inDegree - $0.outDegree
            }

            // If all vertices have same out-degrees as in-degrees - choose any
            // of them.
            if (inAndOutDiffs.values.allSatisfy {
                $0 == 0
            }) {
                return self.allVertices.first
            }

            // If all but 2 vertices have same out-degree as in-degree, and one
            // of those 2 vertices has out-degree with one greater than its
            // in-degree, and the other has in-degree with one greater than its
            // out-degree - then choose the vertex that has its out-degree with
            // one greater than its in-degree.
            let verticesThatHaveOutDegreeWithOneGreaterThanItsInDegree = inAndOutDiffs.filter {
                _, value in
                value == -1
            }
            let verticesThatHaveInDegreeWithOneGreaterThanItsOutDegree = inAndOutDiffs.filter {
                _, value in
                value == 1
            }

            guard
                verticesThatHaveOutDegreeWithOneGreaterThanItsInDegree.count == 1
                    && verticesThatHaveInDegreeWithOneGreaterThanItsOutDegree.count == 1
            else {
                return nil
            }

            return verticesThatHaveOutDegreeWithOneGreaterThanItsInDegree.first!.key
        }

        public var eulerianPathOrCircuit: [Int]? {
            var edges = self.edges

            guard let startingVertex = eulerianPathOrCircuitStartingVertex else {
                return nil
            }
            var maybeCurrentVertex: Int? = startingVertex
            var verticesToDiscover: Stack<Int> = .init(minimumCapacity: self.allVertices.count)
            var reveredPathOrCircuit: [Int] = []

            reveredPathOrCircuit.reserveCapacity(self.allVertices.count)

            while let currentVertex = maybeCurrentVertex {
                // If current vertex has out-going edges (i.e. neighbors)
                // - add the vertex to the stack, take any of its neighbors,
                // remove the edge between that vertex and selected neighbor,
                // and set that neighbor as the current vertex.
                if let neighborVertex = edges[currentVertex]?.popLast() {
                    verticesToDiscover.push(currentVertex)
                    maybeCurrentVertex = neighborVertex
                } else {
                    // If current vertex has no out-going edges (i.e. neighbors)
                    // - add it to circuit, remove the last vertex from the
                    // stack and set it as the current one.
                    reveredPathOrCircuit.append(currentVertex)
                    maybeCurrentVertex = verticesToDiscover.pop()
                }
            }

            return reveredPathOrCircuit.reversed()
        }
    }

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
}
