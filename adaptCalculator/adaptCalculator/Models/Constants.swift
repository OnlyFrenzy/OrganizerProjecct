//
//  Constants.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 22.10.2020.
//

import Foundation

enum CalculatorValidatorReturnValues: String {
    case zero
    case success
    case impossible
    case sign
    case number
    case openBracket
    case closeBracket
    case noChangeSign
    case yesChangeSign
    case onlyChangeSign
    case lastCharIsSign
    case emptyBrackets
}
