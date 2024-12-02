public class LongestSubStringWithoutRepeatingCharacters {
  public static func lengthOfLongestSubstring(_ s: String) -> Int {
    var ch_set = Set<Character>(minimumCapacity: s.count)
    var longest_sub_string_length = 0
    var this_sub_str_queue = Queue<Character>()

    for ch in s {
      if ch_set.contains(ch) {
        while let ch_in_sub_str = this_sub_str_queue.dequeue(), ch != ch_in_sub_str {
          ch_set.remove(ch_in_sub_str)
        }
      }

      ch_set.insert(ch)
      this_sub_str_queue.enqueue(ch)

      longest_sub_string_length = max(longest_sub_string_length, this_sub_str_queue.count)
    }

    return longest_sub_string_length
  }

  struct Queue<T> {
    var head: Node<T>? = nil
    var tail: Node<T>? = nil

    private(set) var count: Int = 0

    mutating func enqueue(_ elem: T) {
      let node = Node(elem)

      if let tail = self.tail {
        tail.next = node
      } else {
        head = node
      }

      count += 1

      tail = node
    }

    mutating func dequeue() -> T? {
      if let head = self.head {
        self.head = head.next

        if self.head == nil {
          self.tail = nil
        }

        count -= 1

        return head.elem
      } else {
        return nil
      }
    }
  }

  class Node<T> {
    internal init(_ elem: T, next: Node? = nil) {
      self.elem = elem
      self.next = next
    }

    var elem: T
    var next: Node?
  }
}
