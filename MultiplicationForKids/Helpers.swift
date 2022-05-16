//
//  Helpers.swift
//  MultiplicationForKids
//
//  Created by Derya Antonelli on 16/05/2022.
//

import Foundation

class Helpers {
    
    static func generateRandomNumbers(min: Int, max: Int, size: Int, include: Int? = nil) -> [Int] {
        var values = Array(min...max).filter { $0 != include }
        var result = [Int]()
        var resultSize = size
        
        if let value = include {
            result.append(value)
            resultSize = resultSize - 1
        }
        
        for _ in 0..<resultSize {
            let randomIndex = Int.random(in: 0..<values.count)
            result.append(values[randomIndex])
            values.remove(at: randomIndex)
        }
        return result.shuffled()
    }
}
