public class MovePiecesToObtainAString {
    public static func canChange(_ start: String, _ target: String) -> Bool {
        var indexInStart = start.startIndex
        var indexInTarget = target.startIndex

        while indexInStart < start.endIndex && indexInTarget < target.endIndex {
            let pieceInTarget = target[indexInTarget]
            let pieceInStart = start[indexInStart]

            if pieceInTarget == "_" {
                indexInTarget = target.index(after: indexInTarget)
            } else if pieceInStart == pieceInTarget {
                if pieceInTarget == "L" && indexInStart < indexInTarget {
                    return false
                }

                if pieceInTarget == "R" && indexInStart > indexInTarget {
                    return false
                }

                indexInTarget = target.index(after: indexInTarget)
                indexInStart = start.index(after: indexInStart)
            } else if pieceInStart == "_" {
                indexInStart = start.index(after: indexInStart)
            } else {
                return false
            }
        }

        while indexInStart < start.endIndex {
            guard start[indexInStart] == "_" else {
                return false
            }
            indexInStart = start.index(after: indexInStart)
        }
        
        while indexInTarget < target.endIndex {
            guard target[indexInTarget] == "_" else {
                return false
            }
            indexInTarget = target.index(after: indexInTarget)
        }

        return true
    }
}
