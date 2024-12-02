public class DailyTemperatures {
  public static func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    var m_stack = [(Int, Int) /* (offset, temperature) */]()
    m_stack.reserveCapacity(temperatures.count)

    var answers = [Int](repeating: 0, count: temperatures.count)

    for (offset, temperature) in temperatures.enumerated() {
      while let (peek_offset, peek_temperature) = m_stack.last, peek_temperature < temperature {
        answers[peek_offset] = offset - peek_offset
        m_stack.removeLast()
      }
      m_stack.append((offset, temperature))
    }

    return answers
  }
}
