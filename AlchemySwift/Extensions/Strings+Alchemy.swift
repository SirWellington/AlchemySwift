//
//  Strings+Alchemy.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/26/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import Foundation


//=====================================
//MARK: Convenient Access Variables
//=====================================
public extension String
{

    static let empty = ""

    static func isEmpty(_ string: String?) -> Bool
    {
        return string?.isEmpty ?? true
    }

    static func notEmpty(_ string: String?) -> Bool
    {
        return string?.notEmpty ?? false
    }

    var notEmpty: Bool
    {
        return !isEmpty
    }
    
    var length: Int { return count }

    var intValue: Int?
    {
        return Int(self)
    }

    var firstLetter: String?
    {
        guard notEmpty else { return nil }
        return self.first?.asString
    }

    var lastLetter: String?
    {
        guard notEmpty else { return nil }
        return self.last?.asString
    }

    var asAttributed: NSAttributedString
    {
        return NSAttributedString(string: self)
    }

    var asURL: URL?
    {
        return URL(string: self)
    }

    func asDate(dateFormat: String, timeZone: TimeZone = .autoupdatingCurrent) -> Date?
    {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.timeZone = timeZone

        return formatter.date(from: self)
    }

}

//=====================================
//MARK: STRING TRANSFORMATIONS
//=====================================
public extension String
{

    func withoutFirstLetter() -> String?
    {
        guard notEmpty else { return nil }

        let substring = self.dropFirst()
        return String(substring)
    }

    func withoutLastLetter() -> String?
    {
        guard notEmpty else { return nil }

        let substring = self.dropLast()
        return String(substring)
    }

    func removingPrefix(prefix: String) -> String
    {
        guard let substring = self.range(of: prefix) else { return self }

        let newString = self.replacingCharacters(in: substring, with: "")
        return newString
    }

    func trimmingEmptySpaces() -> String
    {
        return trimmingCharacters(in: CharacterSet(charactersIn: " "))
    }
    
    func titlecased() -> String
    {
        var lowercased = self.lowercased()
        let firstCharacter = lowercased.removeFirst()
        let firstCharacterUpper = "\(firstCharacter)".uppercased()
        
        return "\(firstCharacterUpper)\(lowercased)"
    }

    func surroundedByQuotationMarks() -> String
    {
        return "“\(self)”"
    }
}


//======================================
// MARK: ATTRIBUTED STRINGS
//======================================

public extension NSAttributedString
{

    func asMutable() -> NSMutableAttributedString
    {
        return .init(attributedString: self)
    }

    func copyWithAttributes(_ attributes: [NSAttributedStringKey: Any]) -> NSAttributedString
    {
        let copy =  self.asMutable()
        copy.setAttributes(attributes)
        return copy
    }
}

public extension NSMutableAttributedString
{

    func setAttributes(_ attributes: [NSAttributedStringKey: Any])
    {
        let range = NSMakeRange(0, self.length)
        self.setAttributes(attributes, range: range)
    }
}

//=====================================
//MARK: Character Extensions
//=====================================
public extension Character
{
    var asString: String { return "\(self)" }
}


//=====================================
//MARK: Custom Operators
//=====================================

infix operator ???: NilCoalescingPrecedence

/**
    This nifty little function allows you to coalesce an optional value into a String.

    If the optional value exists, the usual String representation will be returned.
    If it does not exist, `defaultValue` will be used instead.
*/
public func ???<T>(optional: T?, defaultValue: @autoclosure () -> String) -> String
{
    if let value = optional
    {
        return String(describing: value)
    }
    else
    {
        return defaultValue()
    }
}
