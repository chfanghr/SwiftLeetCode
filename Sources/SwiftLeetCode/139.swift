public class WordBreak {
  public static func fuck() {
    print(
      Self.wordBreak(
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab",
        [
          "a", "aa", "aaa", "aaaa", "aaaaa", "aaaaaa", "aaaaaaa", "aaaaaaaa", "aaaaaaaaa",
          "aaaaaaaaaa",
        ]))
  }

  public static func fuck1() {
    print(
      Self.wordBreak(
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab",
        ["a", "aa", "ba"]))
  }

  public static func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var trie = Trie()
    for word in wordDict {
      trie.insert(word)
    }

    var word_start_stack = [s.startIndex]
    var visited_positions = Set<String.Index>()

    while !word_start_stack.isEmpty {
      let word_start = word_start_stack.removeLast()

      if visited_positions.contains(word_start) {
        continue
      }

      let next_word_start_candidates = trie.find_first_word_end_indexes(s.suffix(from: word_start))

      var next_word_start_indices = [String.Index]()

      next_word_start_indices.reserveCapacity(next_word_start_candidates.count)

      for candidate in next_word_start_candidates {
        if candidate == s.endIndex {
          return true
        }

        if let last_candidate = next_word_start_indices.last,
          s.distance(from: candidate, to: last_candidate) == -1 && s[candidate] == s[last_candidate]
        {
          next_word_start_indices.removeLast()
        }

        next_word_start_indices.append(candidate)
      }

      for word_end in next_word_start_indices {
        trie.insert(s.prefix(upTo: word_end))
      }

      visited_positions.insert(word_start)
      word_start_stack.append(contentsOf: next_word_start_indices)
    }

    return false
  }

  public struct Trie {
    public init() {
      self.root = .init()
    }

    var root: TrieVertex

    public mutating func insert(_ str: String) {
      self.insert(Substring(str))
    }

    public mutating func insert(_ str: Substring) {
      if str.isEmpty {
        return
      }

      self.root.insert(Substring(str))
    }

    public func find_first_word_end_indexes(_ str: String) -> [String.Index] {
      self.find_first_word_end_indexes(Substring(str))
    }

    public func find_first_word_end_indexes(_ str: Substring) -> [String.Index] {
      if str.isEmpty {
        return []
      }

      var res = [String.Index]()

      root.find_first_word_end_indexes(str, &res)

      return res
    }

    class TrieVertex {
      var next_vertexes: [Character: TrieVertex] = [:]
      var is_output: Bool = false

      func insert(_ str: Substring) {
        if str.isEmpty {
          self.is_output = true
          return
        }

        let head = str.first!
        let tail = str.dropFirst()

        if let next_vertex = self.next_vertexes[head] {
          next_vertex.insert(tail)
        } else {
          let next_vertex = TrieVertex()
          next_vertex.insert(tail)
          self.next_vertexes[head] = next_vertex
        }
      }

      func find_first_word_end_indexes(_ str: Substring, _ res: inout [String.Index]) {
        if self.is_output {
          res.append(str.startIndex)
        }

        if str.isEmpty {
          return
        }

        let head = str.first!
        let tail = str.dropFirst()

        if let next_vertex = self.next_vertexes[head] {
          next_vertex.find_first_word_end_indexes(tail, &res)
        }
      }
    }
  }
}
