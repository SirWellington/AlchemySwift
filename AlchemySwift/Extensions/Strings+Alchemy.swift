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

    var notEmpty: Bool
    {
        return !isEmpty
    }

    var intValue: Int?
    {
        return Int(self)
    }

    var firstLetter: String?
    {
        guard notEmpty else { return nil }
        return self.first?.string
    }

    var lastLetter: String?
    {
        guard notEmpty else { return nil }
        return self.last?.string
    }

    var asAttributed: NSAttributedString
    {
        return NSAttributedString(string: self)
    }

    var asURL: URL?
    {
        return URL(string: self)
    }
}

//=====================================
//MARK: Convenience Functions
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
}


//=====================================
//MARK: Character Extensions
//=====================================
extension Character
{
    var string: String { return "\(self)" }
}
