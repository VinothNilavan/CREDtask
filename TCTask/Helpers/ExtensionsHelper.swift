//
//  Extensions.swift
//  TCTask
//
//  Created by Vinoth on 16/07/20.
//  Copyright © 2020 NOVIS. All rights reserved.
//

import Foundation
import UIKit

extension String {
        
    func getAlphabets() -> [String] {
        return ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    }
    
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
        
    func matchesPattern(pattern: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options(rawValue: 0))
            let range: NSRange = NSMakeRange(0, self.count)
            let matches        = regex.matches(in: self, options: NSRegularExpression.MatchingOptions(), range: range)
            return matches.count > 0
        } catch _ {
            return false
        }
    }
        
    subscript(_ range: CountableRange<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: max(0, range.lowerBound))
        let idx2 = index(startIndex, offsetBy: min(self.count, range.upperBound))
        return String(self[idx1..<idx2])
    }
    
    func grouping(every groupSize: String.IndexDistance, with separator: Character) -> String {
       let cleanedUpCopy = replacingOccurrences(of: String(separator), with: "")
       return String(cleanedUpCopy.enumerated().map() {
            $0.offset % groupSize == 0 ? [separator, $0.element] : [$0.element]
       }.joined().dropFirst())
    }
    func modifyCreditCardString(creditCardString : String) -> String {
        let trimmedString = creditCardString.components(separatedBy: .whitespaces).joined()

        let arrOfCharacters = Array(trimmedString)
        var modifiedCreditCardString = ""

        if(arrOfCharacters.count > 0) {
            for i in 0...arrOfCharacters.count-1 {
                modifiedCreditCardString.append(arrOfCharacters[i])
                if((i+1) % 4 == 0 && i+1 != arrOfCharacters.count){
                    modifiedCreditCardString.append(" ")
                }
            }
        }
        return modifiedCreditCardString
    }
}

extension UIView {
    
    func cornerRadius(_ radius:CGFloat = 10, _ width:CGFloat = 0.2, _ color:UIColor = UIColor.clear) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth  = width
        self.layer.borderColor  = color.cgColor
    }
    
}
public extension String {
    
    /// Remove characters from given set from the string. Looks for characters
    /// from set in the whole string, not only its beginning and end.
    ///
    /// - Parameter set: Character set, with characters we want to remove
    /// - Returns: New String with characters from given set removed
    func removingCharactersInSet(_ set: CharacterSet) -> String {
        // solution from: http://stackoverflow.com/a/32927899/4508436
        let stringParts = self.components(separatedBy: set)
        let notEmptyStringParts = stringParts.filter { text in
            text.isEmpty == false
        }
        let result = notEmptyStringParts.joined(separator: "")
        return result
    }
    
    
    /// Remove whitespace and newlines characters from the string. Looks for
    /// characters from set in the whole string, not only its beginning and end.
    ///
    /// - Returns: New String with whitespace and newline characters removed
    func removingWhitespaceAndNewlines() -> String {
        return self.removingCharactersInSet(CharacterSet.whitespacesAndNewlines)
    }
}
