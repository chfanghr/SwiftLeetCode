public class MinimizedMaximum {
  public static func minimizedMaximum(_ stores: Int, _ quantities: [Int]) -> Int {
    if quantities.isEmpty || stores == 0 {
      fatalError()
    }

    if quantities.count == 1 {
      return quantities.first!
    }

    let canDistribute = { (max_quantity: Int) in
      let required_stores = quantities.map {
        let (quo, rem) = $0.quotientAndRemainder(dividingBy: max_quantity)
        let this_required_store = quo + (rem == 0 ? 0 : 1)
        return this_required_store
      }.reduce(0, +)

      return required_stores <= stores
    }

    var lower_quantity_bound = 0
    var upper_quantity_bound = quantities.max()!

    while lower_quantity_bound != upper_quantity_bound - 1 {
      let mid_quantity = (lower_quantity_bound + upper_quantity_bound) / 2

      if canDistribute(mid_quantity) {
        upper_quantity_bound = mid_quantity
      } else {
        lower_quantity_bound = mid_quantity
      }
    }

    return upper_quantity_bound
  }
}
