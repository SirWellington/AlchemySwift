//
//  Strings+AlchemyTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/26/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import AlchemyGenerator
@testable import AlchemySwift
import AlchemyTest
import Foundation
import XCTest

class StringsPlusAlchemyTests: AlchemyTest
{
    override var iterations: Int { return 100 }

    private var newString: String { return AlchemyGenerator.Strings.alphabetic }

    override func setUp()
    {
    }

    func testStaticNotEmpty()
    {
        repeatTest
        {
            assertTrue(String.notEmpty(newString))
            assertFalse(String.notEmpty(""))
            assertFalse(String.notEmpty(nil))
        }
    }

    func testStaticIsEmpty()
    {
        repeatTest
        {
            assertFalse(String.isEmpty(newString))
            assertTrue(String.isEmpty(""))
            assertTrue(String.isEmpty(nil))
        }
    }


    func testNotEmpty()
    {
        repeatTest
        {
            assertTrue(newString.notEmpty)
        }
    }

    func testLength()
    {
        repeatTest
        {
            let string = self.newString
            assertEquals(string.length, string.count)
        }
    }

    func testNotEmptyWithEmptyString()
    {
        let emptyString = ""
        assertFalse(emptyString.notEmpty)
    }

    func testIntValueWithValidString()
    {
        repeatTest
        {
            let number = AlchemyGenerator.positiveInteger()
            let string = "\(number)"

            let result = string.intValue
            assertNotNil(result)
            assertEquals(result, number)
        }
    }

    func testIntValueWithNegativeNumber()
    {
        repeatTest
        {
            let number = AlchemyGenerator.negativeInteger()
            let string = "\(number)"

            let result = string.intValue
            assertNotNil(result)
            assertEquals(result, number)
        }
    }

    func testIntValueWithNonNumber()
    {
        repeatTest
        {
            let result = newString.intValue
            assertNil(result)
        }
    }

    func testAsDate()
    {
        let calendar = Calendar.autoupdatingCurrent

        repeatTest
        {
            let date = AlchemyGenerator.Dates.any
            let format = "yyyy/MM/dd"
            let string = date.formatTo(dateFormat: format)

            let result = string.asDate(dateFormat: format)
            let expectedComponents = calendar.dateComponents([.year, .month, .day], from: date)
            let expectedDate = calendar.date(from: expectedComponents)

            assertEquals(result, expectedDate)
        }
    }

    func testAsDateWhenNotADate()
    {
        repeatTest
        {
            let string = AlchemyGenerator.alphabeticString()
            let date = string.asDate(dateFormat: "yyyy/MM/dd")
            assertNil(date)
        }
    }

    func testFirstLetter()
    {
        repeatTest
        {
            let string = self.newString
            let expected = string.first!.asString
            let result = string.firstLetter

            assertNotNil(result)
            assertEquals(result, expected)
        }
    }

    func testLastLetter()
    {
        repeatTest
        {
            let string = self.newString
            let expected = string.last!.asString
            let result = string.lastLetter

            assertNotNil(result)
            assertEquals(result, expected)
        }
    }

    func testAsAttributed()
    {
        repeatTest
        {
            let string = self.newString
            let expected = NSAttributedString(string: string)
            let result = string.asAttributed
            
            assertEquals(result, expected)
        }
    }

    func testStringDotEmpty()
    {
        assertEquals(String.empty, "")
    }

}


//=====================================
//MARK: TRANSFORMATIONS
//=====================================
extension StringsPlusAlchemyTests
{

    func testWithoutFirstLetter()
    {
        repeatTest
        {
            let string = self.newString

            let beginIndex = string.index(after: string.startIndex)
            let expected = string.substring(from: beginIndex)
            let result = string.withoutFirstLetter()
            assertEquals(result, expected)
        }
    }

    func testWithoutLastLetter()
    {
        repeatTest
        {
            let string = self.newString

            let endIndex = string.index(before: string.endIndex)
            let expected = string.substring(to: endIndex)
            let result = string.withoutLastLetter()

            assertEquals(result, expected)
        }
    }

    func testRemovingPrefix()
    {
        repeatTest
        {
            let prefix = self.newString
            let string = self.newString
            let combined = prefix + string
            let result = combined.removingPrefix(prefix: prefix)
            assertEquals(result, string)
        }
    }

    func testTrimmingEmptySpaces()
    {
        repeatTest
        {
            let simpleString = self.newString
            var trimmed = simpleString.trimmingEmptySpaces()
            assertEquals(trimmed, simpleString)

            let string = self.newString
            let stringWithSpaces = " " + string + " "
            trimmed = stringWithSpaces.trimmingEmptySpaces()
            assertEquals(trimmed, string)
        }
    }

    func testTitleCased()
    {
        repeatTest
        {
            let string = self.newString
            let firstLetter = self.newString.firstLetter!
            let combined = firstLetter + string
            let expected = firstLetter.uppercased() + string

            let result = combined.titlecased()

            assertEquals(result, expected)
        }
    }

    func testSurroundedByQuotationMarks()
    {
        repeatTest
        {
            let string = self.newString
            let expected = "“\(string)”"
            let result = string.surroundedByQuotationMarks()
            assertEquals(result, expected)
        }
    }
}


//=====================================
//MARK: Character Extensions
//=====================================
extension StringsPlusAlchemyTests
{
    func testStringFromCharacter()
    {
        repeatTest
        {
            let string = self.newString
            let character = string.first!

            let expected = "\(character)"
            let result = character.asString

            assertEquals(result, expected)
        }
    }
}


//=====================================
//MARK: Custom Operators
//=====================================
extension StringsPlusAlchemyTests
{
    func testStringCoalesceOperator()
    {
        repeatTest
        {
            let optional: Any? = self.newString
            let defaultValue = self.newString
            assertEquals(optional ??? defaultValue, "\(optional!)")
        }

        repeatTest
        {
            let defaultValue = self.newString
            let optional: Any? = nil
            assertEquals(optional ??? defaultValue, defaultValue)
        }
    }
}
