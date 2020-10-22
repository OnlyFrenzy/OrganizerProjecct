//
//  Constants.swift
//  adaptCalculator
//
//  Created by OnlyFrenzy on 22.10.2020.
//

import Foundation

<<<<<<< HEAD

struct Constants {
    static let openBracket: Character = "("
    static let closeBracket: Character = ")"
    static let zero: Character = "0"
    static let dot: Character = "."
    static let empty = ""
    static let equal = "="
=======
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
>>>>>>> 487a61d900c5706709a95f9298d38610929ca3e2
}
