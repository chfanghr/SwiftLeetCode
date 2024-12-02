public class ReverseLinkedList {
  public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() {
      self.val = 0
      self.next = nil
    }
    public init(_ val: Int) {
      self.val = val
      self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
      self.val = val
      self.next = next
    }
  }

  public static func reverseList(_ head: ListNode?) -> ListNode? {
    var this_node = head
    var last_node: ListNode? = nil

    while let maybe_node = this_node {
      this_node = maybe_node.next
      maybe_node.next = last_node
      last_node = maybe_node
    }

    return last_node
  }
}
