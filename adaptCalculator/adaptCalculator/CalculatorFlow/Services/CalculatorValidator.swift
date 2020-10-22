//
//  CalculatorValidator.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 20.10.2020.
//

import Foundation


class CalculatorValidator {


    private let openBracket: Character = "("
    private let closeBracket: Character = ")"
    private let dot: Character = "."
    private let zeroValue = "0"
    private let emptyValue = ""
    private var bracketIsOpen = false
    
    private func isDotYet(inputString: String) -> Bool {
        
        var dotYet = false
        let charArrayInputString = Array(inputString)
        var numberCharacterCheckCharArrayInputString = charArrayInputString.count - 1
        var checSimbolNow = charArrayInputString[numberCharacterCheckCharArrayInputString]
        
        while (checSimbolNow.isNumber || checSimbolNow == dot )
                && numberCharacterCheckCharArrayInputString > 0 {
            if checSimbolNow == dot {
                dotYet = true
            }
            numberCharacterCheckCharArrayInputString -= 1
            checSimbolNow = charArrayInputString[numberCharacterCheckCharArrayInputString]
        }
        return dotYet
    }

    func validateBinarySign (inputString: String) -> Bool {
        
        let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
        
        if !(Sign(rawValue: String(lastSimbolInputString)) != nil) && lastSimbolInputString != openBracket {
            return true
        } else {
            return false
        }
    }
    
    func validateNumber(inputString: String) -> String {
        
        let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
        
        if inputString == zeroValue {
            return CalculatorValidatorReturnValues.zero.rawValue
        }
        if lastSimbolInputString != closeBracket {
            return CalculatorValidatorReturnValues.success.rawValue
        } else {
            return CalculatorValidatorReturnValues.impossible.rawValue
        }
    }
    
    func validateDot(inputString: String) -> String {
        
        let dotCanPut = isDotYet(inputString: inputString)
        
        if !dotCanPut {
            
            let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
            
            if  inputString == zeroValue {
                return CalculatorValidatorReturnValues.zero.rawValue
            }
            if (Sign(rawValue: String(lastSimbolInputString)) != nil) || lastSimbolInputString == openBracket {
                return CalculatorValidatorReturnValues.sign.rawValue
            }
            if lastSimbolInputString.isNumber {
                return CalculatorValidatorReturnValues.number.rawValue
            } else {
                return CalculatorValidatorReturnValues.impossible.rawValue
            }
        } else {
            return CalculatorValidatorReturnValues.impossible.rawValue
        }
    }
    
    func validateSqrt(inputString: String) -> String {
        
        let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
        
        if inputString == zeroValue {
            return CalculatorValidatorReturnValues.zero.rawValue
        }
        if String(lastSimbolInputString) == Sign.squareRoot.rawValue
            || lastSimbolInputString == closeBracket
            || lastSimbolInputString == dot
            || lastSimbolInputString.isNumber {
            return CalculatorValidatorReturnValues.impossible.rawValue
        } else {
            return CalculatorValidatorReturnValues.success.rawValue
        }
    }
    
    func validateBrackets(inputString: String) -> String {
        
        let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
        
        if inputString == zeroValue {
            return CalculatorValidatorReturnValues.zero.rawValue
        }
        if (Sign(rawValue: String(lastSimbolInputString)) != nil) && bracketIsOpen == false {
            bracketIsOpen = true
            return CalculatorValidatorReturnValues.openBracket.rawValue
        }
        if lastSimbolInputString == openBracket {
            return CalculatorValidatorReturnValues.emptyBrackets.rawValue
        }
        if lastSimbolInputString.isNumber
            || lastSimbolInputString == dot
            && bracketIsOpen == true {
            bracketIsOpen = false
            return CalculatorValidatorReturnValues.closeBracket.rawValue
        } else {
            return CalculatorValidatorReturnValues.impossible.rawValue
        }
    }
    
    func validateChangeSign(inputString: String) -> String {
        
        let countInputString = inputString.count
        
        if countInputString <= 1 {
            if inputString.contains("0") {
                return CalculatorValidatorReturnValues.zero.rawValue
            } else {
                return CalculatorValidatorReturnValues.noChangeSign.rawValue
            }
        } else {
            if inputString[inputString.startIndex] == "0"
                && inputString[inputString.index(after: inputString.startIndex)] == "-"
                && countInputString == 2 {
                return CalculatorValidatorReturnValues.onlyChangeSign.rawValue
            }
            if inputString[inputString.startIndex] == "0"
                && inputString[inputString.index(after: inputString.startIndex)] == "-" {
                return CalculatorValidatorReturnValues.yesChangeSign.rawValue
            }
            return CalculatorValidatorReturnValues.noChangeSign.rawValue
        }
    }
    
    func validateExpression(inputString: String) -> String {
        
        if inputString == zeroValue || inputString == emptyValue {
            return CalculatorValidatorReturnValues.zero.rawValue
        } else {
            let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
            
            if (Sign(rawValue: String(lastSimbolInputString)) != nil) || lastSimbolInputString == openBracket {
                return CalculatorValidatorReturnValues.lastCharIsSign.rawValue
            }
            if lastSimbolInputString == closeBracket {
                
                let preLastSimbolInputString = inputString[inputString.index(before: inputString.index(before: inputString.endIndex))]
                
                if preLastSimbolInputString.isNumber || preLastSimbolInputString == dot {
                    return CalculatorValidatorReturnValues.success.rawValue
                }
            }
            return CalculatorValidatorReturnValues.success.rawValue
        }
    }
}

