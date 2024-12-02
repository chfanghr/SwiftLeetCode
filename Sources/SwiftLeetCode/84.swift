public class LargestRectangleArea {
  public static func largestRectangleArea(_ heights: [Int]) -> Int {
    let backward_cant_fit_offsets = Self.backward_cant_fit(heights)
    let forward_cant_fit_offsets = Self.forward_cant_fit(heights)

    debugPrint(backward_cant_fit_offsets, forward_cant_fit_offsets, separator: "\n")

    let count = heights.count

    var max_area = 0

    for (offset, height) in heights.enumerated() {
      let backward_count = offset - (backward_cant_fit_offsets[offset] ?? -1) - 1
      let forward_count = (forward_cant_fit_offsets[offset] ?? count) - offset - 1
      let area = height * (backward_count + forward_count + 1)

      debugPrint(backward_count, forward_count, area)

      max_area = max(max_area, area)
    }

    return max_area
  }

  static func backward_cant_fit(_ heights: [Int]) -> [Int?] {
    var s = Stack<Int>()
    var indexes: [Int?] = .init(repeating: nil, count: heights.count)

    for (offset, height) in heights.enumerated() {
      while let that_offset = s.peek(), heights[that_offset] >= height {
        let _ = s.pop()
      }

      indexes[offset] = s.peek()

      s.push(offset)
    }

    return indexes
  }

  static func forward_cant_fit(_ heights: [Int]) -> [Int?] {
    var s = Stack<Int>()
    var indexes: [Int?] = .init(repeating: nil, count: heights.count)

    for (offset, height) in heights.enumerated().reversed() {
      while let that_offset = s.peek(), heights[that_offset] >= height {
        let _ = s.pop()
      }

      indexes[offset] = s.peek()

      s.push(offset)
    }

    return indexes
  }

  struct Stack<T> {
    var top: Node<T>? = nil

    mutating func push(_ val: T) {
      let top = Node(elem: val, next: self.top)
      self.top = top
    }

    mutating func pop() -> T? {
      guard let top = self.top else {
        return nil
      }

      self.top = top.next
      return top.elem
    }

    func peek() -> T? {
      self.top?.elem
    }
  }

  class Node<T> {
    init(elem: T, next: Node<T>? = nil) {
      self.elem = elem
      self.next = next
    }

    let elem: T
    let next: Node<T>?
  }
}