public class ValidParentheses {
  public static func isValid(_ s: String) -> Bool {
    var st = Stack<ParenKind>()

    var res = true

    let validate_top = { (expected: ParenKind) -> Bool in
      guard let top = st.pop() else {
        return false
      }
      return top == expected
    }

    for c in s {
      switch c {
      case "[":
        st.push(.Square)
      case "]":
        res = res && validate_top(.Square)
      case "(":
        st.push(.Bracket)
      case ")":
        res = res && validate_top(.Bracket)
      case "{":
        st.push(.Brace)
      case "}":
        res = res && validate_top(.Brace)
      default:
        fatalError()
      }
    }

    return res && st.isEmpty
  }

  enum ParenKind {
    case Square
    case Bracket
    case Brace
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

    var peek: T? {
      self.top?.elem
    }

    var isEmpty: Bool {
      self.top == nil
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
