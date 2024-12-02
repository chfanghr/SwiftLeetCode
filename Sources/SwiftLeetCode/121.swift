public class MaxProfit {
    public static func maxProfit(_ prices: [Int]) -> Int {
        switch prices.count {
          case 0, 1:
            return 0
          default:
            var min_price = Int.max
            var max_profit = 0

            for price in prices {
              min_price = min(min_price, price)
              max_profit = max(max_profit, price - min_price)
            }

            return max_profit
        }
    }
}