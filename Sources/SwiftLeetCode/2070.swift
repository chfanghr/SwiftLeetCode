public class MaximumBeauty {
  public static func maximumBeauty(_ items: [[Int]], _ queries: [Int]) -> [Int] {
    let items = items.sorted(by: { $0[0] < $1[0] })
    var max_beauty_at_item_price_points: [(Int, Int)] = .init(repeating: (0, 0), count: items.count)

    max_beauty_at_item_price_points[0] = (items[0][0], items[0][1])

    for (offset, item) in items.enumerated().dropFirst() {
      let prev_offset = offset - 1
      max_beauty_at_item_price_points[offset] = (
        item[0], max(max_beauty_at_item_price_points[prev_offset].1, item[1])
      )
    }

    max_beauty_at_item_price_points.reverse()

    for (offset, (price, _)) in max_beauty_at_item_price_points.enumerated().dropFirst() {
      let (prev_price, prev_beauty) = max_beauty_at_item_price_points[offset - 1]
      if prev_price == price {
        max_beauty_at_item_price_points[offset] = (prev_price, prev_beauty)
      }
    }

    let queries = queries.enumerated().sorted(by: { $0.element > $1.element })
    var responses: [Int] = .init(repeating: 0, count: queries.count)

    var offset_in_max_beauty_at_item_price_points = 0

    for (offset, query) in queries {
      while offset_in_max_beauty_at_item_price_points < max_beauty_at_item_price_points.count {
        let (price, max_beauty) = max_beauty_at_item_price_points[
          offset_in_max_beauty_at_item_price_points]
        if query >= price {
          responses[offset] = max_beauty
          break
        } else {
          offset_in_max_beauty_at_item_price_points += 1
        }
      }
    }

    return responses
  }
}
