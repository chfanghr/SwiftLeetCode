public class GenerateParenthesis {
  public static func generateParenthesis(_ n: Int) -> [String] {
    if n <= 0 {
      fatalError()
    }

    return StateTreeNode(n).flatten()
  }

  enum Paren {
    case open
    case close

    func to_char() -> Character {
      switch self {
      case .open: "("
      case .close: ")"
      }
    }
  }

  struct State: Hashable {
    let paren: Paren
    let total_open: Int
    let not_closed: Int
  }

  class StateTreeNode {
    let state: State
    let next: [StateTreeNode]

    private init(_ max_open: Int, _ current_state: State, _ cache: inout [State: [State]]) {
      self.state = current_state

      var next_states: [State] = []

      if let cached_next_states = cache[current_state] {
        next_states = cached_next_states
      } else {
        if current_state.total_open < max_open {
          next_states.append(
            State(
              paren: .open, total_open: current_state.total_open + 1,
              not_closed: current_state.not_closed + 1))
        }
        if current_state.not_closed > 0 {
          next_states.append(
            State(
              paren: .close, total_open: current_state.total_open,
              not_closed: current_state.not_closed - 1)
          )
        }
        cache[current_state] = next_states
      }

      self.next = [StateTreeNode](
        next_states.map { StateTreeNode(max_open, $0, &cache) })
    }

    convenience init(_ max_open: Int) {
      let initial_state = State(paren: .open, total_open: 1, not_closed: 1)
      var cache = [State: [State]]()

      self.init(max_open, initial_state, &cache)
    }

    func flatten() -> [String] {
      var ch_stack = Stack<Character>()
      var solutions: [String] = []

      self.traverse(ch_stack: &ch_stack, solutions: &solutions)

      return solutions
    }

    private func traverse(ch_stack: inout Stack<Character>, solutions: inout [String]) {
      ch_stack.push(self.state.paren.to_char())

      if self.next.isEmpty {
        solutions.append(String(ch_stack.to_list()))
      } else {
        for next_node in self.next {
          next_node.traverse(ch_stack: &ch_stack, solutions: &solutions)
        }
      }

      _ = ch_stack.pop()
    }
  }

  struct Stack<T> {
    var top: StakeNode<T>? = nil

    mutating func push(_ elem: T) {
      let node = StakeNode(elem, next: self.top)
      self.top = node
      count += 1
    }

    mutating func pop() -> T? {
      let top = self.top
      if top != nil {
        count -= 1
      }
      self.top = top?.next
      return top?.elem
    }

    var peek: T? {
      self.top?.elem
    }

    private(set) var count: Int = 0

    func to_list() -> [T] {
      var ret: [T] = .init()
      ret.reserveCapacity(self.count)

      var maybe_top = self.top

      while let top = maybe_top {
        ret.append(top.elem)
        maybe_top = top.next
      }

      ret.reverse()

      return ret
    }
  }

  class StakeNode<T> {
    internal init(_ elem: T, next: GenerateParenthesis.StakeNode<T>? = nil) {
      self.elem = elem
      self.next = next
    }

    let elem: T
    var next: StakeNode<T>?

  }
}
