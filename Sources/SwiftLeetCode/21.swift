class MergeTwoList {
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

  func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var maybe_node_from_list1 = list1
    var maybe_node_from_list2 = list2

    let dummy_head = ListNode(0, nil)
    var tail: ListNode = dummy_head

    while let node_from_list1 = maybe_node_from_list1,
      let node_from_list2 = maybe_node_from_list2
    {
      var next_node: ListNode? =
        nil

      if node_from_list1.val < node_from_list2.val {
        maybe_node_from_list1 = node_from_list1.next
        next_node = node_from_list1
      } else {
        maybe_node_from_list2 = node_from_list2.next
        next_node = node_from_list2
      }

      tail.next = next_node
      tail = next_node!

      tail.next = nil
    }

    if let node_from_list1 = maybe_node_from_list1 {
      tail.next = node_from_list1
    }

    if let node_from_list2 = maybe_node_from_list2 {
      tail.next = node_from_list2
    }

    return dummy_head.next
  }
}
