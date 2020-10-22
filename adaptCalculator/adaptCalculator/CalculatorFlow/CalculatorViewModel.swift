//
//  CalculatorViewModel.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 06.10.2020.
//

import UIKit


class CalculatorViewModel {
    
    var calculatorService = CalculatorService()
    var calculatorValidator = CalculatorValidator()
<<<<<<< HEAD
    var currentValue: String = String(Constants.zero) {
=======
    var currentValue: String = "0" {
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
        didSet {
            displayDelegate?.showCurrentValue(value: currentValue)
        }
    }
    
    weak var displayDelegate: CalculatorDisplayDelegate?
    
    func signButtonColor() -> UIColor {
        return .black
    }
    
    func onClickNumberButton(number: Int) {
        
        let validateNumber = calculatorValidator.validateNumber(inputString: currentValue)
        
        switch validateNumber {
        
<<<<<<< HEAD
        case .zero:
            currentValue = String(number)
            
        case .success:
=======
        case CalculatorValidatorReturnValues.zero.rawValue:
            currentValue = String(number)
            
        case CalculatorValidatorReturnValues.success.rawValue:
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
            currentValue += String(number)
            
        default:
            return
        }
    }
    
    func onClickDotButton() {
        
        let validateDot = calculatorValidator.validateDot(inputString: currentValue)
        
        switch validateDot {
<<<<<<< HEAD
        case .sign:
            currentValue += String(Constants.zero) + String(Constants.dot)
            
        case .zero:
            currentValue = String(Constants.zero) + String(Constants.dot)
            
        case .number:
            currentValue += String(Constants.dot)
=======
        case CalculatorValidatorReturnValues.sign.rawValue:
            currentValue += "0."
            
        case CalculatorValidatorReturnValues.zero.rawValue:
            currentValue = "0."
            
        case CalculatorValidatorReturnValues.number.rawValue:
            currentValue += "."
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
        default:
            return
        }
    }
    
    func onClickClearButton() {
<<<<<<< HEAD
        currentValue = String(Constants.zero)
=======
        currentValue = "0"
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
    }
    
    func onClickChangeSignButton() {
        
        let validateChangeSign = calculatorValidator.validateChangeSign(inputString: currentValue)
        
        switch validateChangeSign {
<<<<<<< HEAD
        case .noChangeSign:
            currentValue.insert(Character(Sign.minus.rawValue), at: currentValue.startIndex)
            currentValue.insert(Constants.zero, at: currentValue.startIndex)
            
        case .onlyChangeSign:
            currentValue = String(Constants.zero)
            
        case .yesChangeSign:
            currentValue.remove(at: currentValue.startIndex)
            currentValue.remove(at: currentValue.startIndex)
            
        case .zero:
            currentValue = String(Constants.zero) + Sign.minus.rawValue
=======
        case CalculatorValidatorReturnValues.noChangeSign.rawValue:
            currentValue.insert("-", at: currentValue.startIndex)
            currentValue.insert("0", at: currentValue.startIndex)
        
        case CalculatorValidatorReturnValues.onlyChangeSign.rawValue:
            currentValue = "0"
            
        case CalculatorValidatorReturnValues.yesChangeSign.rawValue:
            currentValue.remove(at: currentValue.startIndex)
            currentValue.remove(at: currentValue.startIndex)
            
        case CalculatorValidatorReturnValues.zero.rawValue:
            currentValue = "0-"
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
            
        default:
            return
        }
    }
    
    func onClickBracketsButton() {
        
        
        let validateBrackets = calculatorValidator.validateBrackets(inputString: currentValue)
        
        switch validateBrackets {
<<<<<<< HEAD
        case .zero:
            currentValue = String(Constants.openBracket)
            
        case .openBracket:
            currentValue += String(Constants.openBracket)
            
        case .closeBracket:
            currentValue += String(Constants.closeBracket)
            
        case .emptyBrackets:
            currentValue += String(Constants.zero) + String(Constants.closeBracket)
=======
        case CalculatorValidatorReturnValues.zero.rawValue:
            currentValue = "("
            
        case CalculatorValidatorReturnValues.openBracket.rawValue:
            currentValue += "("
            
        case CalculatorValidatorReturnValues.closeBracket.rawValue:
            currentValue += ")"
            
        case CalculatorValidatorReturnValues.emptyBrackets.rawValue:
            currentValue += "0)"
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
        default:
            return
        }
        
    }
    
    func onClickPlusButton() {
        
        let validateBinarySign = calculatorValidator.validateBinarySign(inputString: currentValue)
        
<<<<<<< HEAD
        if validateBinarySign { currentValue += Sign.plus.rawValue }
=======
        if validateBinarySign { currentValue += "+" }
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
    }
    
    func onClickMinusButton() {
        
        let validateBinarySign = calculatorValidator.validateBinarySign(inputString: currentValue)
        
<<<<<<< HEAD
        if validateBinarySign { currentValue += Sign.minus.rawValue }
=======
        if validateBinarySign { currentValue += "-" }
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
    }
    
    func onClickDivisionButton() {
        
        let validateBinarySign = calculatorValidator.validateBinarySign(inputString: currentValue)
        
<<<<<<< HEAD
        if validateBinarySign { currentValue += Sign.division.rawValue }
=======
        if validateBinarySign { currentValue += "÷" }
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
    }
    
    func onClickMultButton() {
        
        let validateBinarySign = calculatorValidator.validateBinarySign(inputString: currentValue)
        
<<<<<<< HEAD
        if validateBinarySign { currentValue += Sign.multiply.rawValue }
=======
        if validateBinarySign { currentValue += "✕" }
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
    }
    
    func onClickSqrtButton() {
        
        let validateSqrt = calculatorValidator.validateSqrt(inputString: currentValue)
        
        switch validateSqrt {
<<<<<<< HEAD
        case .zero:
            currentValue = Sign.squareRoot.rawValue
            
        case .success:
            currentValue += Sign.squareRoot.rawValue
=======
        case CalculatorValidatorReturnValues.zero.rawValue:
            currentValue = "√"
            
        case CalculatorValidatorReturnValues.success.rawValue:
            currentValue += "√"
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
        default:
            return
        }
    }
    
    func onClickCalculateButton() {
        func doesContainEqualSign(inputString: String) -> String {
            var returnString = inputString
<<<<<<< HEAD
            if inputString.contains(Constants.equal) {
                let valueAfterEqual = inputString.components(separatedBy: Constants.equal)
                returnString = valueAfterEqual[1]
                if returnString[returnString.index(after: returnString.startIndex)] == Character(Sign.minus.rawValue) {
                    returnString.insert(Constants.zero, at: returnString.startIndex)
=======
            if inputString.contains("=") {
                let valueAfterEqual = inputString.components(separatedBy: "=")
                returnString = valueAfterEqual[1]
                if returnString[returnString.index(after: returnString.startIndex)] == "-" {
                    returnString.insert("0", at: returnString.startIndex)
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
                }
            }
            return returnString
        }
        
        let verifiedValue = doesContainEqualSign(inputString: currentValue)
<<<<<<< HEAD
        var validateExpression = calculatorValidator.validateExpression(inputString: currentValue)
        
        while validateExpression != .success
                && validateExpression != .zero {
            currentValue.removeLast()
            validateExpression = calculatorValidator.validateExpression(inputString: currentValue)
        }
        
        switch validateExpression {
        case .zero:
            currentValue = String(Constants.zero)
            
        case .success:
            if let result = calculatorService.calculate(inputString: verifiedValue) {
                currentValue = verifiedValue + Constants.equal + String(result)
=======
        var validateCalculate = calculatorValidator.validateExpression(inputString: currentValue)
        
        while validateCalculate != CalculatorValidatorReturnValues.success.rawValue
                && validateCalculate != CalculatorValidatorReturnValues.zero.rawValue {
            currentValue.removeLast()
            validateCalculate = calculatorValidator.validateExpression(inputString: currentValue)
        }
        
        switch validateCalculate {
        case CalculatorValidatorReturnValues.zero.rawValue:
            currentValue = "0"
            
        case CalculatorValidatorReturnValues.success.rawValue:
            if let result = calculatorService.calculate(inputString: verifiedValue) {
                currentValue = verifiedValue + " = \(result)"
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
            }
        default:
            return
        }
    }
}
