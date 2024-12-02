public class DefuseTheBomb {
  public static func decrypt(_ code: [Int], _ k: Int) -> [Int] {
    if code.isEmpty {
      return []
    }

    if k == 0 {
      return [Int](repeating: 0, count: code.count)
    }

    var prefix_sums = [Int]()
    prefix_sums.reserveCapacity(code.count)

    let code = if k < 0 { Array(code.reversed()) } else { code }

    for elem in code {
      prefix_sums.append(elem + (prefix_sums.last ?? 0))
    }

    var answers = [Int](repeating: 0, count: code.count)

    let abs_k = if k < 0 { abs(k) } else { k }

    let repeated_sum = abs_k / code.count * prefix_sums.last!
    let remain = abs_k % code.count

    for offset in code.indices {
      let remain = offset + remain
      answers[offset] =
        if remain < code.count {
          prefix_sums[remain] - prefix_sums[offset]
        } else {
          prefix_sums.last! - prefix_sums[offset] + prefix_sums[remain - code.count]
        }
      answers[offset] += repeated_sum
    }

    if k < 0 {
      answers.reverse()
    }

    return answers
  }
}
