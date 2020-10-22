//
//  CalculatorValidator.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 20.10.2020.
//

import Foundation


class CalculatorValidator {


<<<<<<< HEAD
    private var bracketIsOpen = false
    
    private func isSign(inputString: String) -> Bool {
        return Sign(rawValue: inputString) != nil
    }
    
=======
    private let openBracket: Character = "("
    private let closeBracket: Character = ")"
    private let dot: Character = "."
    private let zeroValue = "0"
    private let emptyValue = ""
    private var bracketIsOpen = false
    
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
    private func isDotYet(inputString: String) -> Bool {
        
        var dotYet = false
        let charArrayInputString = Array(inputString)
        var numberCharacterCheckCharArrayInputString = charArrayInputString.count - 1
        var checSimbolNow = charArrayInputString[numberCharacterCheckCharArrayInputString]
        
<<<<<<< HEAD
        while (checSimbolNow.isNumber || checSimbolNow == Constants.dot)
                && numberCharacterCheckCharArrayInputString > 0 {
            if checSimbolNow == Constants.dot {
=======
        while (checSimbolNow.isNumber || checSimbolNow == dot )
                && numberCharacterCheckCharArrayInputString > 0 {
            if checSimbolNow == dot {
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
                dotYet = true
            }
            numberCharacterCheckCharArrayInputString -= 1
            checSimbolNow = charArrayInputString[numberCharacterCheckCharArrayInputString]
        }
        return dotYet
    }

    func validateBinarySign (inputString: String) -> Bool {
        
        let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
        
<<<<<<< HEAD
        if !isSign(inputString: String(lastSimbolInputString)) && lastSimbolInputString != Constants.openBracket {
=======
        if !(Sign(rawValue: String(lastSimbolInputString)) != nil) && lastSimbolInputString != openBracket {
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
            return true
        } else {
            return false
        }
    }
    
<<<<<<< HEAD
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
=======
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
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
        
        let dotCanPut = isDotYet(inputString: inputString)
        
        if !dotCanPut {
            
            let lastSimbolInputString = inputString[inputString.index(before: inputString.endIndex)]
            
<<<<<<< HEAD
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
=======
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
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
        }
    }
}

