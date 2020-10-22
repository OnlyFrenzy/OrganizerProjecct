//
//  CalculatorService.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 12.10.2020.
//

import Foundation


class CalculatorService {
    
    func calculate(inputString: String) -> Double? {
        let postfixStrings = reversTermToPostfix(inputString: inputString)
        return calculateEndValue(postfixStrings: postfixStrings)
    }
    
    private func reversTermToPostfix(inputString: String) -> [String] {
        
        var calculatorStack = Stack()
        var resultStrings = [String]()
<<<<<<< HEAD
        var buferString = Constants.empty
        
        for char in inputString {
            
            if char == Constants.openBracket {
                calculatorStack.push(String(char))
            }
            if char == Constants.closeBracket {
                if !buferString.isEmpty{
                    resultStrings.append(buferString)
                    buferString = Constants.empty
                }
                while calculatorStack.topItem != String(Constants.openBracket) {
=======
        var buferString = ""
        
        for char in inputString {
            
            if char == "(" {
                calculatorStack.push(String(char))
            }
            if char == ")" {
                if !buferString.isEmpty{
                    resultStrings.append(buferString)
                    buferString = ""
                }
                while calculatorStack.topItem != "(" {
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
                    resultStrings.append(calculatorStack.pop())
                }
                _ = calculatorStack.pop()
            }
            if let sign = Sign(rawValue: String(char)) {
                
                if !buferString.isEmpty{
                    resultStrings.append(buferString)
<<<<<<< HEAD
                    buferString = Constants.empty
=======
                    buferString = ""
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
                }
                
                while calculatorStack.isNeedToPopTopElement(sign: sign) {
                    resultStrings.append(calculatorStack.pop())
                }
                
                calculatorStack.push(sign.rawValue)
<<<<<<< HEAD
            } else if char.isNumber || char == Constants.dot {
=======
            } else if char.isNumber || char == "." {
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
                buferString += String(char)
            }
        }
        
        if !buferString.isEmpty {
            resultStrings.append(buferString)
        }
        
        
        resultStrings += calculatorStack.popAllValues()
        return resultStrings
    }
    
    private func calculateEndValue(postfixStrings: [String]) -> Double? {
        
        var doubleArray = [Double]()
        postfixStrings.forEach { (value) in
            
            if let sign = Sign(rawValue: value) {
                
                if sign == .squareRoot {
                    guard let lhs = doubleArray.popLast() else { return }
                    
                    let result = sign.calculate(lhs: lhs)
                    doubleArray.append(result)
                } else {
                    guard let rhs = doubleArray.popLast(),
                          let lhs = doubleArray.popLast() else { return }
                    
                    let result = sign.calculate(lhs: lhs, rhs: rhs)
                    doubleArray.append(result)
                }
            } else {
                guard let doubleValue = Double(value) else { return }
                
                doubleArray.append(doubleValue)
            }
        }
        return doubleArray.last
    }
}
