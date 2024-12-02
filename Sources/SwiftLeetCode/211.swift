public class DesignAddAndSearchWordsDataStructure {
  public class WordDictionary {
    class Vertex {
      var nextVertexes: [Character: Int] = [:]
      var is_end_of_word: Bool = false
    }

    static func getHeadAndTail(of word: Substring) -> (Character, Substring)? {
      if word.isEmpty {
        return nil
      }

      let head = word.first!
      let tail = word.dropFirst()

      return (head, tail)
    }

    var vertexes: [Vertex] = [.init()]

    public init() {}

    public func addWord(_ word: String) {
      if word.isEmpty {
        fatalError()
      }

      if self.vertexes.count < word.count {
        self.vertexes.reserveCapacity(word.count)
      }

      var headAndTail = Self.getHeadAndTail(of: word[...])
      var currentVertexOffset = 0

      while let (head, tail) = headAndTail {
        let current_vertex = self.vertexes[currentVertexOffset]

        if current_vertex.nextVertexes[head] == nil {
          let new_vertex = Vertex()
          self.vertexes.append(new_vertex)
          let new_vertex_offset = vertexes.indices.last!
          current_vertex.nextVertexes[head] = new_vertex_offset
        }

        currentVertexOffset = current_vertex.nextVertexes[head]!
        headAndTail = Self.getHeadAndTail(of: tail)
      }

      self.vertexes[currentVertexOffset].is_end_of_word = true
    }

    public func search(_ word: String) -> Bool {
      if word.isEmpty {
        return false
      }

      var next_vertex_indexes = [(0, word[...])]

      while let (vertex_index, word) = next_vertex_indexes.popLast() {
        let current_vertex = self.vertexes[vertex_index]

        if word.isEmpty {
          if current_vertex.is_end_of_word {
            return true
          }
          continue
        }

        let (head, tail) = Self.getHeadAndTail(of: word)!

        switch head {
        case ".":
          next_vertex_indexes.append(
            contentsOf: current_vertex.nextVertexes.values.map { ($0, tail) })
        default:
          if let next_vertex_index = current_vertex.nextVertexes[head] {
            next_vertex_indexes.append((next_vertex_index, tail))
          }
        }
      }

      return false
    }
  }
}
