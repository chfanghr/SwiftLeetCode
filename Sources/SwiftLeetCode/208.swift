public class ImplementTrie {
  class Trie {
    static func getHeadAndTail(of word: Substring) -> (Character, Substring)? {
      if word.isEmpty {
        return nil
      }

      let head = word.first!
      let tail = word.dropFirst()

      return (head, tail)
    }

    class Vertex {
      var next_vertexes: [Character: Vertex] = [:]
      var is_end_of_word: Bool = false

      func insert(_ word: Substring) {
        if word.isEmpty {
          self.is_end_of_word = true
          return
        }

        let (head, tail) = getHeadAndTail(of: word)!

        let next_vertex =
          if let vertex = self.next_vertexes[head] {
            vertex
          } else {
            Vertex()
          }

        next_vertexes[head] = next_vertex
        next_vertex.insert(tail)
      }

      func search(_ word: Substring) -> Bool {
        if word.isEmpty {
          return self.is_end_of_word
        }

        let (head, tail) = getHeadAndTail(of: word)!

        guard let next_vertex = self.next_vertexes[head] else {
          return false
        }

        return next_vertex.search(tail)
      }

      func startsWith(_ prefix: Substring) -> Bool {
        if prefix.isEmpty {
          return true
        }

        let (head, tail) = getHeadAndTail(of: prefix)!

        guard let next_vertex = self.next_vertexes[head] else {
          return false
        }

        return next_vertex.startsWith(tail)
      }
    }

    var root: Vertex

    init() {
      self.root = .init()
    }

    func insert(_ word: String) {
      self.root.insert(Substring(word))
    }

    func search(_ word: String) -> Bool {
      self.root.search(Substring(word))
    }

    func startsWith(_ prefix: String) -> Bool {
      self.root.startsWith(Substring(prefix))
    }
  }
}
