import Foundation

class StockMaximize {
    
    func countProfit(prices: [Int]) -> Int {
        var profit = 0
        for (index, price) in prices.enumerated() {
            if let maxPrice = prices.dropFirst(index + 1).max() {
                if price < maxPrice {
                    profit += maxPrice - price
                }
            }
        }
        return profit
    }
}
