import Foundation

public typealias Supply = (weight: Int, value: Int)

public final class Knapsack {
    let maxWeight: Int
    let drinks: [Supply]
    let foods: [Supply]
    var maxKilometers: Int {
        findMaxKilometres()
    }
    
    init(_ maxWeight: Int, _ foods: [Supply], _ drinks: [Supply]) {
        self.maxWeight = maxWeight
        self.drinks = drinks
        self.foods = foods
    }
    
    func getKnapsack(for array: [Supply]) -> [[Int]] {
        var knapsack = Array(repeating: Array(repeating: 0, count: maxWeight + 1), count: array.count + 1)
        for index in 0...array.count {
            for weight in 0...maxWeight {
                if index != 0 && weight != 0 {
                    knapsack[index][weight] = array[index - 1].weight > weight ? knapsack[index - 1][weight] : max(knapsack[index - 1][weight], (array[index - 1].value + knapsack[index - 1][weight - array[index - 1].weight]))
                }
            }
        }
        return knapsack
    }
    
    func findMaxKilometres() -> Int {
        guard maxWeight > 0 && maxWeight <= 2500 else { return 0 }
        let food = getKnapsack(for: foods)
        let drink = getKnapsack(for: drinks)
        var maxDistance = 0
        for i in 0...maxWeight {
            maxDistance = max(maxDistance, min(food[foods.count][i], drink[drinks.count][maxWeight-i]))
        }
        return maxDistance
    }
}
