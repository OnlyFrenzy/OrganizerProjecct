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
    var currentValue: String = String(Constants.zero) {
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
        
        case .zero:
            currentValue = String(number)
            
        case .success:
            currentValue += String(number)
            
        default:
            return
        }
    }
    
    func onClickDotButton() {
        
        let validateDot = calculatorValidator.validateDot(inputString: currentValue)
        
        switch validateDot {
        case .sign:
            currentValue += String(Constants.zero) + String(Constants.dot)
            
        case .zero:
            currentValue = String(Constants.zero) + String(Constants.dot)
            
        case .number:
            currentValue += String(Constants.dot)
        default:
            return
        }
    }
    
    func onClickClearButton() {
        currentValue = String(Constants.zero)
    }
    
    func onClickChangeSignButton() {
        
        let validateChangeSign = calculatorValidator.validateChangeSign(inputString: currentValue)
        
        switch validateChangeSign {
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
            
        default:
            return
        }
    }
    
    func onClickBracketsButton() {
        
        
        let validateBrackets = calculatorValidator.validateBrackets(inputString: currentValue)
        
        switch validateBrackets {
        case .zero:
            currentValue = String(Constants.openBracket)
            
        case .openBracket:
            currentValue += String(Constants.openBracket)
            
        case .closeBracket:
            currentValue += String(Constants.closeBracket)
            
        case .emptyBrackets:
            currentValue += String(Constants.zero) + String(Constants.closeBracket)
        default:
            return
        }
        
    }
    
    func onClickPlusButton() {
        
        let validateBinarySign = calculatorValidator.validateBinarySign(inputString: currentValue)
        
        if validateBinarySign { currentValue += Sign.plus.rawValue }
    }
    
    func onClickMinusButton() {
        
        let validateBinarySign = calculatorValidator.validateBinarySign(inputString: currentValue)
        
        if validateBinarySign { currentValue += Sign.minus.rawValue }
    }
    
    func onClickDivisionButton() {
        
        let validateBinarySign = calculatorValidator.validateBinarySign(inputString: currentValue)
        
        if validateBinarySign { currentValue += Sign.division.rawValue }
    }
    
    func onClickMultButton() {
        
        let validateBinarySign = calculatorValidator.validateBinarySign(inputString: currentValue)
        
        if validateBinarySign { currentValue += Sign.multiply.rawValue }
    }
    
    func onClickSqrtButton() {
        
        let validateSqrt = calculatorValidator.validateSqrt(inputString: currentValue)
        
        switch validateSqrt {
        case .zero:
            currentValue = Sign.squareRoot.rawValue
            
        case .success:
            currentValue += Sign.squareRoot.rawValue
        default:
            return
        }
    }
    
    func onClickCalculateButton() {
        func doesContainEqualSign(inputString: String) -> String {
            var returnString = inputString
            if inputString.contains(Constants.equal) {
                let valueAfterEqual = inputString.components(separatedBy: Constants.equal)
                returnString = valueAfterEqual[1]
                if returnString[returnString.index(after: returnString.startIndex)] == Character(Sign.minus.rawValue) {
                    returnString.insert(Constants.zero, at: returnString.startIndex)
                }
            }
            return returnString
        }
        
        let verifiedValue = doesContainEqualSign(inputString: currentValue)
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
            }
        default:
            return
        }
    }
}
