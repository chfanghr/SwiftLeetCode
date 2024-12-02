public class CheckIfAWordOccursAsAPrefixOfAnyWordInASentence {
    public static func isPrefixOfWord(_ sentence: String, _ searchWord: String) -> Int {
        var trie = Self.Trie()

        for (idx, word) in Self.words(sentence).enumerated() {
            trie.insert(word, idx + 1)
        }

        return trie.search(searchWord).min() ?? -1
    }

    public static func isPrefixOfWordLazy(_ sentence: String, _ searchWord: String) -> Int {
        for (idx, word) in Self.words(sentence).enumerated() {
            if word.starts(with: searchWord) {
                return idx + 1
            }
        }

        return -1
    }

    public static func words(_ sentence: String) -> [String] {
        var words: [String] = []
        var currentWord: [Character] = .init()

        for ch in sentence {
            if ch == " " && !currentWord.isEmpty {
                words.append(String(currentWord))
                currentWord.removeAll()
            }else {
                currentWord.append(ch)
            }
        }

        if !currentWord.isEmpty {
            words.append(String(currentWord))
        }

        return words
    }

    public struct Trie{
        class Vertex {
            var nexts: [Character: Vertex] = [:]
            var indices: [Int] = []

            func insert(_ str: String, _ index: Int) {
                self.insert(str[...], index)
            }

            private func insert(_ seq: String.SubSequence, _ index: Int) {
                self.indices.append(index)
                var seq = seq
                guard let ch = seq.popFirst() else {
                    return
                }
                if self.nexts[ch] == nil {
                    self.nexts[ch] = Vertex()
                }
                self.nexts[ch]!.insert(seq, index)
            }

            func search(_ str: String) -> [Int] {
                self.search(str[...])
            }

            private func search(_ seq: String.SubSequence) -> [Int] {
                var seq = seq
                guard let ch = seq.popFirst() else {
                    return self.indices
                }
                guard let next = self.nexts[ch] else {
                    return []
                }
                return next.search(seq)
            }
        }

        var node: Vertex = .init()

        public init() {}

        mutating func insert(_ str: String, _ index: Int) {
            self.node.insert(str, index)
        }

        func search(_ str: String) -> [Int] {
            self.node.search(str)
        }
    }
}
