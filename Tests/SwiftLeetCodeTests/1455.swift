import SwiftCheck
import XCTest

@testable import dsa_swift

struct Word {
    let word: String

    func arbPrefix() -> Gen<String> {
        if self.word.isEmpty {
            return Gen<String>.pure("")
        }

        let arbEndIndex = Gen<String.Index>.fromElements(of: Set(word.indices))
        let arbValidPrefix = arbEndIndex.map {
            String(word[..<$0])
        }
        let arbInvalidPrefix = arbValidPrefix.map {
            $0 + "MakeItInvalid"
        }
        return Gen<String>.frequency([
            (3, arbValidPrefix),
            (1, arbInvalidPrefix),
        ])
    }

    func toString() -> String {
        self.word
    }
}

// screw the shrinker, I am lazy

extension Word: Arbitrary {
    public static var arbitrary: Gen<Word> {
        String.arbitrary.resize(10).map {
            Word(word: $0)
        }
    }
}

struct Sentence {
    let words: [Word]

    func arbPrefix() -> Gen<String> {
        Gen<Word>.fromElements(of: self.words).flatMap {
            $0.arbPrefix()
        }
    }

    func toString() -> String {
        words.map { $0.toString() }.joined(separator: " ")
    }
}

extension Sentence: Arbitrary {
    public static var arbitrary: Gen<Sentence> {
        Word.arbitrary.proliferateNonEmpty.resize(10).map {
            Sentence(words: $0)
        }
    }
}

struct TestParams {
    let sentence: String
    let searchWord: String
}

extension TestParams: Arbitrary {
    public static var arbitrary: Gen<TestParams> {
        Gen<TestParams>.compose { c in
            let sentence: Sentence = c.generate()
            let searchWord = c.generate(using: sentence.arbPrefix())
            return TestParams(sentence: sentence.toString(), searchWord: searchWord)
        }
    }
}

class SpecFor1455: XCTestCase {
    func testAll() {
        property(
            "Lazy and trie implementation should return the same result",
            arguments: CheckerArguments(maxAllowableSuccessfulTests: 1000, maxTestCaseSize: 1000))
            <- forAll { (p: TestParams) in
                CheckIfAWordOccursAsAPrefixOfAnyWordInASentence.isPrefixOfWord(
                    p.sentence, p.searchWord)
                    == CheckIfAWordOccursAsAPrefixOfAnyWordInASentence.isPrefixOfWordLazy(
                        p.sentence, p.searchWord)
            }
    }
}
