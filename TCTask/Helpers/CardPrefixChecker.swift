//
//  CardPrefixChecker.swift
//  TCTask
//
//  Created by Vinoth on 16/07/20.
//  Copyright © 2020 NOVIS. All rights reserved.
//

import Foundation

public class CreditCardPrefix {
    
    /// Credit Card type prefix starting range
    public let rangeStart: Int
    
    /// Credit Card type prefix ending range
    public let rangeEnd: Int
    
    /// Credit Card type prefix length
    public let prefixLength: Int
    
    
    /// Initialize CreditCardPrefix instance with information about prefix range
    /// start, end and length
    ///
    /// - Parameters:
    ///   - rangeStart: Start of prefix range. E.g. if given card type can have
    ///                 beginnings from 51 to 55, rangeStart would be 51
    ///   - rangeEnd: End of prefix range. E.g. if given card type can have
    ///               beginnings from 51 to 55, rangeEnd would be 55
    ///   - length: Length of credit card type prefix. E.g. if given card can
    ///             have beginnings from 51 to 55, length would be 2 (two digits)
    public init(rangeStart: Int, rangeEnd: Int, length: Int) {
        self.rangeStart = rangeStart
        self.rangeEnd = rangeEnd
        self.prefixLength = length
    }
}

class CardValidator : NSObject {
            
        /// Array of prefixes describing credit card type. E.g. Visa prefix is just number `4`
        /// and the prefix is of length 1 (i.e. we check only first digit when
        /// looking for prefix)
        public let prefixes: [CreditCardPrefix]
        
        /// Array of possible lengths of a credit card type. E.g. Visa can have 13,
        /// 16 or 19 digits, whereas MasterCard can be only 16 digits.
        public let lengths: [Int]
        
        /// Initialize new CCValidator instance with given set of prefixes and
        /// card lengths
        ///
        /// - Parameters:
        ///   - prefixes: Array of prefixes describing given card type
        ///   - lengths: Array of lengths describing given card type
        public init(prefixes: [CreditCardPrefix], lengths: [Int]) {
            self.prefixes = prefixes
            self.lengths = lengths
        }
        
        /// Initialize new CCValidator instance with given credit card type.
        /// We recommend you use this class, as this way you won't have to know
        /// the specification details for supported credit card types.
        ///
        /// - Parameter type: Credit Card Type. Passing `.NotRecognized` will not
        ///                     throw an error, but will create a validator
        ///                     with empty arrays of prefixes and lengths
        public convenience init(type: CardBrand) {
            // default specs
            var specs: (prefixes: [CreditCardPrefix], lengths:[Int]) = ([], [])
            switch type {
            case .AmericanExpress:
                specs = CardValidator.americanExpressSpecs()
            case .Dankort:
                specs = CardValidator.dankortSpecs()
            case .DinersClub:
                specs = CardValidator.dinersClubSpecs()
            case .Discover:
                specs = CardValidator.discoverSpecs()
            case .JCB:
                specs = CardValidator.jcbSpecs()
            case .Maestro:
                specs = CardValidator.maestroSpecs()
            case .MasterCard:
                specs = CardValidator.masterCardSpecs()
            case .UnionPay:
                specs = CardValidator.unionPaySpecs()
            case .Visa:
                specs = CardValidator.visaSpecs()
            case .VisaElectron:
                specs = CardValidator.visaElectronSpecs()
            case .Unknown:
                // This does nothing, added only to have exhaustive switch case
                // without using default case - so we get compiler error
                // when add a new credit card type and we won't handle it here
                break
            }
            self.init(prefixes: specs.prefixes, lengths: specs.lengths)
        }
        
        private class func americanExpressSpecs() -> (prefixes: [CreditCardPrefix], lengths: [Int]) {
            return (
                prefixes: [CreditCardPrefix(rangeStart: 34, rangeEnd: 34, length: 2),
                           CreditCardPrefix(rangeStart: 37, rangeEnd: 37, length: 2)],
                lengths: [15]
            )
        }
        
        private class func dankortSpecs() -> (prefixes: [CreditCardPrefix], lengths: [Int]) {
            return (
                prefixes: [CreditCardPrefix(rangeStart: 5019, rangeEnd: 5019, length: 4)],
                lengths: [16]
            )
        }
        
        private class func dinersClubSpecs() -> (prefixes: [CreditCardPrefix], lengths: [Int]) {
            return (
                prefixes: [CreditCardPrefix(rangeStart: 300, rangeEnd: 305, length: 3),
                           CreditCardPrefix(rangeStart: 309, rangeEnd: 309, length: 3),
                           CreditCardPrefix(rangeStart: 36, rangeEnd: 36, length: 2),
                           CreditCardPrefix(rangeStart: 38, rangeEnd: 39, length: 2)],
                lengths: [14]
            )
        }
        
        private class func discoverSpecs() -> (prefixes: [CreditCardPrefix], lengths: [Int]) {
            return (
                prefixes: [CreditCardPrefix(rangeStart: 6011, rangeEnd: 6011, length: 4),
                           CreditCardPrefix(rangeStart: 622126, rangeEnd: 622925, length: 6),
                           CreditCardPrefix(rangeStart: 644, rangeEnd: 649, length: 3),
                           CreditCardPrefix(rangeStart: 65, rangeEnd: 65, length: 2)],
                lengths: [16,19]
            )
        }
        
        private class func jcbSpecs() -> (prefixes: [CreditCardPrefix], lengths: [Int]) {
            return (
                prefixes: [CreditCardPrefix(rangeStart: 3528, rangeEnd: 3589, length: 4)],
                lengths: [16]
            )
        }
        
        private class func maestroSpecs() -> (prefixes: [CreditCardPrefix], lengths: [Int]) {
            return (
                prefixes: [CreditCardPrefix(rangeStart: 50, rangeEnd: 50, length: 2),
                           CreditCardPrefix(rangeStart: 56, rangeEnd: 58, length: 2),
                           CreditCardPrefix(rangeStart: 60, rangeEnd: 61, length: 2),
                           CreditCardPrefix(rangeStart: 63, rangeEnd: 69, length: 2)],
                lengths: [12, 13, 14, 15, 16, 17, 18, 19]
            )
        }
        
        private class func masterCardSpecs() -> (prefixes: [CreditCardPrefix], lengths: [Int]) {
            return (
                prefixes: [CreditCardPrefix(rangeStart: 2221, rangeEnd: 2720, length: 4),
                           CreditCardPrefix(rangeStart: 51, rangeEnd: 55, length: 2)],
                lengths: [16]
            )
        }
        
        private class func unionPaySpecs() -> (prefixes: [CreditCardPrefix], lengths: [Int]) {
            return (
                prefixes: [CreditCardPrefix(rangeStart: 62, rangeEnd: 62, length: 2),
                           CreditCardPrefix(rangeStart: 88, rangeEnd: 88, length: 2)],
                lengths: [16, 17, 18, 19]
            )
        }
        
        private class func visaElectronSpecs() -> (prefixes: [CreditCardPrefix], lengths: [Int]) {
            return (
                prefixes: [CreditCardPrefix(rangeStart: 4026, rangeEnd: 4026, length: 4),
                           CreditCardPrefix(rangeStart: 417500, rangeEnd: 417500, length: 6),
                           CreditCardPrefix(rangeStart: 4405, rangeEnd: 4405, length: 4),
                           CreditCardPrefix(rangeStart: 4508, rangeEnd: 4508, length: 4),
                           CreditCardPrefix(rangeStart: 4844, rangeEnd: 4844, length: 4),
                           CreditCardPrefix(rangeStart: 4913, rangeEnd: 4913, length: 4),
                           CreditCardPrefix(rangeStart: 4917, rangeEnd: 4917, length: 4)],
                lengths: [16]
            )
        }
        
        private class func visaSpecs() -> (prefixes: [CreditCardPrefix], lengths: [Int]) {
            return (
                prefixes: [CreditCardPrefix(rangeStart: 4, rangeEnd: 4, length: 1)],
                lengths: [13, 16, 19]
            )
        }
    
}
extension CardValidator {
    
    private func validatePrefixSpecs(creditCardNumber number: String) -> Bool {
        var validationPassed = false
        for prefix in self.prefixes {
            if number.count >= prefix.prefixLength {
                let prefixEndIndex = number.index(number.startIndex, offsetBy: prefix.prefixLength)
                let numberPrefix = number[..<prefixEndIndex]
                if let number = Int(numberPrefix), number >= prefix.rangeStart, number <= prefix.rangeEnd {
                    validationPassed = true
                    break
                }
            }
        }
        return validationPassed
    }
    
    private func validateLengthSpecs(creditCardNumber number: String) -> Bool {
        var validationPassed = false
        if self.lengths.contains(number.count) {
            validationPassed = true
        }
        return validationPassed
    }
    
    private class func possibleTypesCheckingLengthOnly(creditCardNumber number: String) -> [CardBrand] {
        let allTypes = self.allTypes()
        var possibleTypes: [CardBrand] = []
        for type in allTypes {
            let validator = CardValidator(type: type)
            if validator.validateLengthSpecs(creditCardNumber: number) {
                possibleTypes.append(type)
            }
        }
        return possibleTypes
    }
    
    private class func validateWithLuhnAlgorithm(creditCardNumber number: String) -> Bool {
        guard let _ = Int64(number) else {
            //if string is not convertible to int, return false
            return false
        }
        let numberOfChars = number.count
        let numberToCheck = numberOfChars % 2 == 0 ? number : "0" + number
        
        let digits = numberToCheck.map { Int(String($0)) }
        
        let sum = digits.enumerated().reduce(0) { (sum, val: (offset: Int, element: Int?)) in
            if (val.offset + 1) % 2 == 1 {
                let element = val.element!
                return sum + (element == 9 ? 9 : (element * 2) % 9)
            }
            // else
            return sum + val.element!
        }
        let validates = sum % 10 == 0
        return validates
    }
    
    private class func allTypes() -> [CardBrand] {
        return [
            .AmericanExpress,
            .Dankort,
            .DinersClub,
            .Discover,
            .JCB,
            .Maestro,
            .MasterCard,
            .UnionPay,
            .VisaElectron,
            .Visa,
        ]
    }
    
    /// Returns credit card type from prefix number.
    ///
    /// IMPORTANT: It doesn't check if number is valid, only if prefix matches
    /// issuer prefix
    ///
    /// - Parameters:
    ///   - number: Credit Card number
    /// - Returns: Credit Card Type, or `.NotRecognized` if failed to recognize the type
    class func typeCheckingPrefixOnly(creditCardNumber number: String) -> CardBrand {
        return self.typeCheckingPrefixOnly(creditCardNumber: number, checkOnlyFromTypes: self.allTypes())
    }
    
    /// Returns credit card type from prefix number. Returned Type can be only
    /// amongst the one passed as `checkOnlyFromTypes`
    ///
    /// IMPORTANT: It doesn't check if number is valid, only if prefix matches
    /// issuer prefix
    ///
    /// - Parameters:
    ///   - number: Credit Card number
    ///   - types: Types of Credit Card to check (if you don't need to check all possible answers)
    /// - Returns: Credit Card Type, or `.NotRecognized` if failed to recognize the type
    class func typeCheckingPrefixOnly(creditCardNumber number: String, checkOnlyFromTypes types:[CardBrand]) -> CardBrand {
        var type: CardBrand = .Unknown
        let number = number.removingWhitespaceAndNewlines()
        
        for currentType in types {
            let validator = CardValidator(type: currentType)
            if validator.validatePrefixSpecs(creditCardNumber: number) {
                type = currentType
                break
            }
        }
        
        return type
    }

    /// Validates given credit card number, checking card prefix, card length
    /// plus validating number using Luhn algorithm.
    ///
    /// - Returns: `true` if validation was passed, `false` otherwise
    class func validate(creditCardNumber number: String) -> Bool {
        return self.validate(creditCardNumber: number,
                             validatePrefix: true,
                             validateLength: true,
                             useLuhnAlgorithm: true)
    }
    
    /// Validates given credit card number. It allows to check any/all
    /// of following things:
    /// * checking card prefix,
    /// * card length
    /// * validatine using Luhn algorithm
    ///
    /// IMPORTANT: If you pass all validation variables as `false`
    /// nothing will be validated, and function will return `true`
    ///
    /// - Parameters:
    ///   - number: Credit card number
    ///   - validatePrefix: `true` if we should validate card prefix
    ///   - validateLength: `true` if we should validate card length
    ///   - useLuhn: `true` if we should check number using Luhn algorithm
    /// - Returns: `true` if validation was passed, `false` otherwise
    class func validate(creditCardNumber number: String,
                               validatePrefix: Bool,
                               validateLength: Bool, useLuhnAlgorithm useLuhn: Bool) -> Bool {
        let number = number.removingWhitespaceAndNewlines()
        let possibleTypesByLength = self.possibleTypesCheckingLengthOnly(creditCardNumber: number)
        if validateLength
            && possibleTypesByLength.isEmpty {
            return false
        }
        let typeByPrefix = self.typeCheckingPrefixOnly(creditCardNumber: number)
        if validatePrefix
            && typeByPrefix == .Unknown {
            return false
        }
        let isLengthTypeAndPrefixTypeSame = possibleTypesByLength.contains(typeByPrefix)
        if validateLength
            && validatePrefix
            && isLengthTypeAndPrefixTypeSame == false {
            return false
        }
        if useLuhn
            && self.validateWithLuhnAlgorithm(creditCardNumber: number) == false {
            return false
        }
        return true
    }
}

