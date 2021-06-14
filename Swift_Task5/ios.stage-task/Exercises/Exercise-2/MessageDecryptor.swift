import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        var currentRepeats = ""
        var decodedResult = ""
        var numberOfRepeats: [String] = []
        var repeatedStrings: [String] = []
        
        for char in message {
            if char.isNumber {
                currentRepeats = "\(currentRepeats)\(char)"
            } else if char == "[" {
                if currentRepeats.isEmpty {
                    numberOfRepeats.append("1")
                } else {
                    numberOfRepeats.append(currentRepeats)
                }
                currentRepeats = ""
                repeatedStrings.append(decodedResult)
                decodedResult = ""
            } else if char == "]" {
                var currentString = ""
                if let count = Int(numberOfRepeats.popLast() ?? "1") {
                    for _ in 0..<count {
                        currentString += decodedResult
                    }
                }
                decodedResult = repeatedStrings.popLast()! + currentString
            } else if char.isLetter {
                decodedResult += String(char)
            }
        }
        return decodedResult
    }
}
