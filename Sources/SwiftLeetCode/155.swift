class MinStack {
  class Node {
    internal init(elem: Int, min: Int, next: Node? = nil) {
      self.elem = elem
      self.min = min
      self.next = next
    }

    let elem: Int
    let min: Int
    let next: Node?
  }

  var head: Node?

  init() {
    head = nil
  }

  func push(_ val: Int) {
    let min =
      if let head = self.head {
        min(head.min, val)
      } else { val }

    let node = Node(elem: val, min: min, next: head)

    self.head = node
  }

  func pop() {
    self.head = head?.next
  }

  func top() -> Int {
    self.head!.elem
  }

  func getMin() -> Int {
    self.head!.min
  }
}
