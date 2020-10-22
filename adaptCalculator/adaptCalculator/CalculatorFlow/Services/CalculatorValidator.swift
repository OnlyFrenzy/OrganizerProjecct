//
//  CalculatorValidator.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 20.10.2020.
//

import Foundation


class CalculatorValidator {


    private var bracketIsOpen = false
    
    private func isSign(inputString: String) -> Bool {
        return Sign(rawValue: inputString) != nil
    }
    
    private func isDotYet(inputString: String) -> Bool {
        
        var dotYet = false
        let charArrayInputString = Array(inputString)
        var numberCharacterCheckCharArrayInputString = charArrayInputString.count - 1
        var checSimbolNow = charArrayInputString[numberCharacterCheckCharArrayInputString]
        
        while (checSimbolNow.isNumber || checSimbolNow == Constants.dot)
                && numberCharacterCheckCharArrayInputString > 0 {
            if checSimbolNow == Constants.dot {
                dotYet = true
            }
            numberCharacterCheckCharArrayInputString -= 1
            checSimbolNow = charArrayInputString[numberCharacterCheckCharArrayInputString]
        }
        return dotYet
    }

    func validateBinarySign (inputString: String) -> Bool {
        
        let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
        
        if !isSign(inputString: String(lastSimbolInputString)) && lastSimbolInputString != Constants.openBracket {
            return true
        } else {
            return false
        }
    }
    
    func validateNumber(inputString: String) -> CalculatorValidatorReturnValues {
        
        let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
        
        if inputString == String(Constants.zero) {
            return .zero
        }
        if lastSimbolInputString != Constants.closeBracket {
            return .success
        } else {
            return .impossible
        }
    }
    
    func validateDot(inputString: String) -> CalculatorValidatorReturnValues {
        
        let dotCanPut = isDotYet(inputString: inputString)
        
        if !dotCanPut {
            
            let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
            
            if  inputString == String(Constants.zero) {
                return .zero
            }
            if isSign(inputString: String(lastSimbolInputString)) || lastSimbolInputString == Constants.openBracket {
                return .sign
            }
            if lastSimbolInputString.isNumber {
                return .number
            } else {
                return .impossible
            }
        } else {
            return .impossible
        }
    }
    
    func validateSqrt(inputString: String) -> CalculatorValidatorReturnValues {
        
        let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
        
        if inputString == String(Constants.zero) {
            return .zero
        }
        if String(lastSimbolInputString) == Sign.squareRoot.rawValue
            || lastSimbolInputString == Constants.closeBracket
            || lastSimbolInputString == Constants.dot
            || lastSimbolInputString.isNumber {
            return .impossible
        } else {
            return .success
        }
    }
    
    func validateBrackets(inputString: String) -> CalculatorValidatorReturnValues {
        
        let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
        
        if inputString == String(Constants.zero) {
            return .zero
        }
        if isSign(inputString: String(lastSimbolInputString)) && bracketIsOpen == false {
            bracketIsOpen = true
            return .openBracket
        }
        if lastSimbolInputString == Constants.openBracket {
            return .emptyBrackets
        }
        if (lastSimbolInputString.isNumber
            || lastSimbolInputString == Constants.dot)
            && bracketIsOpen == true {
            bracketIsOpen = false
            return .closeBracket
        } else {
            return .impossible
        }
    }
    
    func validateChangeSign(inputString: String) -> CalculatorValidatorReturnValues {
        
        let countInputString = inputString.count
        let firsValueInputString = inputString[inputString.startIndex]
        let secondValueInputString = inputString[inputString.index(after: inputString.startIndex)]
        
        if countInputString <= 1 {
            if inputString.contains(Constants.zero) {
                return .zero
            } else {
                return .noChangeSign
            }
        } else {
            if firsValueInputString == Constants.zero
                && secondValueInputString == Character(Sign.minus.rawValue)
                && countInputString == 2 {
                return .onlyChangeSign
            }
            if firsValueInputString == Constants.zero
                && secondValueInputString == Character(Sign.minus.rawValue) {
                return .yesChangeSign
            }
            return .noChangeSign
        }
    }
    
    func validateExpression(inputString: String) -> CalculatorValidatorReturnValues {
        
        if inputString == String(Constants.zero) || inputString == Constants.empty {
            return .zero
        } else {
            let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
            
            if isSign(inputString: String(lastSimbolInputString)) || lastSimbolInputString == Constants.openBracket {
                return .lastCharIsSign
            }
            if lastSimbolInputString == Constants.closeBracket {
                
                let preLastSimbolInputString = inputString[inputString.index(before: inputString.index(before: inputString.endIndex))]
                
                if preLastSimbolInputString.isNumber || preLastSimbolInputString == Constants.dot {
                    return .success
                }
            }
            return .success
        }
    }
}

