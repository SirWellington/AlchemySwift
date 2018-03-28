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

    private let _iterations = 100

    private var newString: String { return AlchemyGenerator.Strings.alphabetic }

    override func setUp()
    {
    }

    func testStaticNotEmpty()
    {
        runTest(iterations: _iterations)
        {
            assertTrue(String.notEmpty(newString))
            assertFalse(String.notEmpty(""))
            assertFalse(String.notEmpty(nil))
        }
    }

    func testStaticIsEmpty()
    {
        runTest(iterations: _iterations)
        {
            assertFalse(String.isEmpty(newString))
            assertTrue(String.isEmpty(""))
            assertTrue(String.isEmpty(nil))
        }
    }


    func testNotEmpty()
    {
        runTest(iterations: _iterations)
        {
            assertTrue(newString.notEmpty)
        }
    }

    func testLength()
    {
        runTest(iterations: _iterations)
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
        runTest(iterations: _iterations)
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
        runTest(iterations: _iterations)
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
        runTest(iterations: _iterations)
        {
            let result = newString.intValue
            assertNil(result)
        }
    }

    func testAsDate()
    {
        let calendar = Calendar.autoupdatingCurrent

        runTest(iterations: _iterations)
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
        runTest(iterations: _iterations)
        {
            let string = AlchemyGenerator.alphabeticString()
            let date = string.asDate(dateFormat: "yyyy/MM/dd")
            assertNil(date)
        }
    }

    func testFirstLetter()
    {
        runTest(iterations: _iterations)
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
        runTest(iterations: _iterations)
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
        runTest(iterations: _iterations)
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
    
    func testTitleCased()
    {
        runTest(iterations: _iterations)
        {
            let string = self.newString
            let firstLetter = self.newString.firstLetter!
            let combined = firstLetter + string
            let expected = firstLetter.uppercased() + string
            
            let result = combined.titlecased()
            
            assertEquals(result, expected)
        }
    }
}


//=====================================
//MARK: TRANSFORMATIONS
//=====================================
extension StringsPlusAlchemyTests
{

    func testWithoutFirstLetter()
    {
        runTest(iterations: _iterations)
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
        runTest(iterations: _iterations)
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
        runTest(iterations: _iterations)
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
        runTest(iterations: _iterations)
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
}


//=====================================
//MARK: Character Extensions
//=====================================
extension StringsPlusAlchemyTests
{
    func testStringFromCharacter()
    {
        runTest(iterations: _iterations)
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
        runTest(iterations: _iterations)
        {
            let optional: Any? = self.newString
            let defaultValue = self.newString
            assertEquals(optional ??? defaultValue, "\(optional!)")
        }

        runTest(iterations: _iterations)
        {
            let defaultValue = self.newString
            let optional: Any? = nil
            assertEquals(optional ??? defaultValue, defaultValue)
        }
    }
}
