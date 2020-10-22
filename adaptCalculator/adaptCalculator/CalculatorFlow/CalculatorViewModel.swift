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
//    var numberHaveDot = false
    var currentValue: String = "0" {
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
        
        case CalculatorValidatorReturnValues.zero.rawValue:
            currentValue = String(number)
            
        case CalculatorValidatorReturnValues.success.rawValue:
            currentValue += String(number)
            
        default:
            return
        }
    }
    
    func onClickDotButton() {
        
        let validateDot = calculatorValidator.validateDot(inputString: currentValue)
        
        switch validateDot {
        case CalculatorValidatorReturnValues.sign.rawValue:
            currentValue += "0."
            
        case CalculatorValidatorReturnValues.zero.rawValue:
            currentValue = "0."
            
        case CalculatorValidatorReturnValues.number.rawValue:
            currentValue += "."
        default:
            return
        }
    }
    
    func onClickClearButton() {
        currentValue = "0"
    }
    
    func onClickChangeSignButton() {
        
        let validateChangeSign = calculatorValidator.validateChangeSign(inputString: currentValue)
        
        switch validateChangeSign {
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
            
        default:
            return
        }
    }
    
    func onClickBracketsButton() {
        
        
        let validateBrackets = calculatorValidator.validateBrackets(inputString: currentValue)
        
        switch validateBrackets {
        case CalculatorValidatorReturnValues.zero.rawValue:
            currentValue = "("
            
        case CalculatorValidatorReturnValues.openBracket.rawValue:
            currentValue += "("
            
        case CalculatorValidatorReturnValues.closeBracket.rawValue:
            currentValue += ")"
            
        case CalculatorValidatorReturnValues.emptyBrackets.rawValue:
            currentValue += "0)"
        default:
            return
        }
        
    }
    
    func onClickPlusButton() {
        
        let validateBinarySign = calculatorValidator.validateBinarySign(inputString: currentValue)
        
        if validateBinarySign { currentValue += "+" }
    }
    
    func onClickMinusButton() {
        
        let validateBinarySign = calculatorValidator.validateBinarySign(inputString: currentValue)
        
        if validateBinarySign { currentValue += "-" }
    }
    
    func onClickDivisionButton() {
        
        let validateBinarySign = calculatorValidator.validateBinarySign(inputString: currentValue)
        
        if validateBinarySign { currentValue += "÷" }
    }
    
    func onClickMultButton() {
        
        let validateBinarySign = calculatorValidator.validateBinarySign(inputString: currentValue)
        
        if validateBinarySign { currentValue += "✕" }
    }
    
    func onClickSqrtButton() {
        
        let validateSqrt = calculatorValidator.validateSqrt(inputString: currentValue)
        
        switch validateSqrt {
        case CalculatorValidatorReturnValues.zero.rawValue:
            currentValue = "√"
            
        case CalculatorValidatorReturnValues.success.rawValue:
            currentValue += "√"
        default:
            return
        }
    }
    
    func onClickCalculateButton() {
        func doesContainEqualSign(inputString: String) -> String {
            var returnString = inputString
            if inputString.contains("=") {
                let valueAfterEqual = inputString.components(separatedBy: "=")
                returnString = valueAfterEqual[1]
                if returnString[returnString.index(after: returnString.startIndex)] == "-" {
                    returnString.insert("0", at: returnString.startIndex)
                }
            }
            return returnString
        }
        
        let verifiedValue = doesContainEqualSign(inputString: currentValue)
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
            }
        default:
            return
        }
    }
}
