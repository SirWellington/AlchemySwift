//
//  Strings+AlchemyTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/26/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import AlchemyGenerator
@testable import AlchemySwift
import Foundation
import XCTest

class StringsPlusAlchemyTests: XCTestCase
{

    let iterations = 100
    var string: String { return AlchemyGenerator.Strings.alphabetic }

    override func setUp()
    {
    }

    func testNotEmpty()
    {
        iterations.repeatBlock
        {
            assertTrue(string.notEmpty)
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

    func testFirstLetter()
    {
        iterations.repeatBlock
        {
            let string = self.string
            let expected = string.first!.string
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
            let expected = string.last!.string
            let result = string.lastLetter

            assertNotNil(result)
            assertEquals(result, expected)
        }
    }

    func testAsAttributed()
    {
        let string = self.string
        let expected = NSAttributedString(string: string)
        let result = string.asAttributed

        assertEquals(result, expected)
    }

    func testStringDotEmpty()
    {
        assertEquals(String.empty, "")
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
            let result = character.string

            assertEquals(result, expected)
        }
    }
}
