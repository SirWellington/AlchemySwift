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

class StringsPlusAlchemyTests: XCTestCase
{

    let iterations = 100
    var string: String { return AlchemyGenerator.Strings.alphabetic }

    override func setUp()
    {
    }

    func testStaticNotEmpty()
    {
        iterations.repeatBlock
        {
            assertTrue(String.notEmpty(string))
            assertFalse(String.notEmpty(""))
            assertFalse(String.notEmpty(nil))
        }
    }

    func testStaticIsEmpty()
    {
        iterations.repeatBlock
        {
            assertFalse(String.isEmpty(string))
            assertTrue(String.isEmpty(""))
            assertTrue(String.isEmpty(nil))
        }
    }


    func testNotEmpty()
    {
        iterations.repeatBlock
        {
            assertTrue(string.notEmpty)
        }
    }

    func testLength()
    {
        iterations.repeatBlock
        {
            let string = self.string
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
        iterations.repeatBlock
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
        iterations.repeatBlock
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
        iterations.repeatBlock
        {
            let result = string.intValue
            assertNil(result)
        }
    }

    func testAsDate()
    {
        let calendar = Calendar.autoupdatingCurrent

        iterations.repeatBlock
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
        iterations.repeatBlock
        {
            let string = AlchemyGenerator.alphabeticString()
            let date = string.asDate(dateFormat: "yyyy/MM/dd")
            assertNil(date)
        }
    }

    func testFirstLetter()
    {
        iterations.repeatBlock
        {
            let string = self.string
            let expected = string.first!.asString
            let result = string.firstLetter

            assertNotNil(result)
            assertEquals(result, expected)
        }
    }

    func testLastLetter()
    {
        iterations.repeatBlock
        {
            let string = self.string
            let expected = string.last!.asString
            let result = string.lastLetter

            assertNotNil(result)
            assertEquals(result, expected)
        }
    }

    func testAsAttributed()
    {
        iterations.repeatBlock
        {
            let string = self.string
            let expected = NSAttributedString(string: string)
            let result = string.asAttributed
            
            assertEquals(result, expected)
        }
    }

    func testStringDotEmpty()
    {
        assertEquals(String.empty, "")
    }
    
    func testTitleCased()
    {
        iterations.repeatBlock
        {
            let string = self.string
            let firstLetter = self.string.firstLetter!
            let combined = firstLetter + string
            let expected = firstLetter.uppercased() + string
            
            let result = combined.titlecased()
            
            assertEquals(result, expected)
        }
    }
}


//=====================================
//MARK: Convenience Functions
//=====================================
extension StringsPlusAlchemyTests
{

    func testWithoutFirstLetter()
    {
        iterations.repeatBlock
        {
            let string = self.string

            let beginIndex = string.index(after: string.startIndex)
            let expected = string.substring(from: beginIndex)
            let result = string.withoutFirstLetter()
            assertEquals(result, expected)
        }
    }

    func testWithoutLastLetter()
    {
        iterations.repeatBlock
        {
            let string = self.string

            let endIndex = string.index(before: string.endIndex)
            let expected = string.substring(to: endIndex)
            let result = string.withoutLastLetter()

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
        iterations.repeatBlock
        {
            let string = self.string
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
        iterations.repeatBlock
        {
            let optional: Any? = self.string
            let defaultValue = self.string
            assertEquals(optional ??? defaultValue, "\(optional!)")
        }

        iterations.repeatBlock
        {
            let defaultValue = self.string
            let optional: Any? = nil
            assertEquals(optional ??? defaultValue, defaultValue)
        }
    }
}
