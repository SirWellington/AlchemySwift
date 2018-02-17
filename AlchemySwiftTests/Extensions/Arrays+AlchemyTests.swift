//
//  Arrays+AlchemyTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/22/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import AlchemyGenerator
@testable import AlchemySwift
import AlchemyTest
import Foundation
import XCTest


class ArraysPlusAlchemyTests: XCTestCase
{
    fileprivate var repetitions = 100

    private var anyString: String { return AlchemyGenerator.Strings.alphanumeric }
    private var strings: [String] = []
    private var secondStrings: [String] = []
    private var numbers: [Int] = []

    override func setUp()
    {
        strings = AlchemyGenerator.array { AlchemyGenerator.Strings.alphabetic }
        secondStrings = AlchemyGenerator.array { AlchemyGenerator.alphanumericString() }
        numbers = AlchemyGenerator.array { AlchemyGenerator.anyInteger() }
    }

    func testNotEmpty()
    {
        let emptyArray = [String]()
        XCTAssertFalse(emptyArray.notEmpty)

        XCTAssertTrue(strings.notEmpty)
    }
    
    func testSize()
    {
        assertEquals(strings.size, strings.count	)
    }

    func testAnyElement()
    {
        let emptyArray = [String]()
        XCTAssertTrue(emptyArray.anyElement == nil)

        let result: String! = strings.anyElement
        XCTAssertFalse(result == nil)

        XCTAssertTrue(strings.contains(result))
    }

    func testShuffle()
    {

        let result = strings.shuffled()

        XCTAssertTrue(result != strings)
        XCTAssertTrue(result.count == strings.count)

        for string in result {
            XCTAssertTrue(result.contains(string))
        }
    }

    func testIsValidIndex()
    {
        let validIndex = AlchemyGenerator.integer(from: 0, to: strings.count)

        XCTAssertTrue(strings.isValidIndex(validIndex))

        let negativeIndex = AlchemyGenerator.negativeInteger()
        XCTAssertFalse(strings.isValidIndex(negativeIndex))

        let invalidIndex = AlchemyGenerator.integer(from: strings.count, to: UInt32.max.intValue)
        XCTAssertFalse(strings.isValidIndex(invalidIndex))
    }

    func testCountWhere()
    {
        let count = strings.countWhere { _ in true }
        XCTAssertTrue(count == strings.count)
    }

    func testCountWhereWhenNone()
    {
        let count = strings.countWhere{ _ in false }
        XCTAssertTrue(count == 0)
    }

    func testAnyElementInRange()
    {
        100.repeatBlock
        {
            let min = 0
            let max = Int.randomFrom(minInclusive: 1, maxExclusive: 1_000)
            let range = min..<max

            let result = range.anyElement!
            XCTAssertTrue(result >= min)
            XCTAssertTrue(result  < max)
        }
    }

    func testRepeatBlock()
    {
        var counter = 0
        let block = {
            counter += 1
        }

        (1...100).repeatBlock(block)

        XCTAssertTrue(counter == 100)
    }

    func testPrepend()
    {
        let newString = self.anyString

        let expected = [newString] + strings
        strings.prepend(newString)

        XCTAssertEqual(strings, expected)
    }

    func testPrependWhenEmpty()
    {
        var array = [String]()
        let newElement = anyString
        let expected = [newElement]

        array.prepend(newElement)
        XCTAssertEqual(array, expected)
    }

    func testPrependMultipleTimes()
    {
        let elementsToPrepend = AlchemyGenerator.Arrays.ofAlphanumericString
        let expected = elementsToPrepend.reversed() + strings

        elementsToPrepend.forEach {
            strings.prepend($0)
        }

        XCTAssertEqual(strings, expected)
    }
    
    func testAdd()
    {
        var array = strings
        let newItem = anyString
        
        let expected = strings + [newItem]
        
        array.add(newItem)
        assertEquals(array, expected)
        
    }
    
    func testPopFirst()
    {
        let expected = strings
        let newItem = anyString
        let original = [newItem] + expected
        
        var array = original
        let poppedElement = array.popFirst()
        assertNotNil(poppedElement)
        assertEquals(poppedElement, newItem)
        
        assertEquals(array, expected)
    }
    
    func testPopFirstOnEmptyArray()
    {
        var array = [String]()
        
        let result = array.popFirst()
        assertNil(result)
    }
    
    func testPopFirstOnEntireArray()
    {
        let original = strings
        var array = original
        
        var storage = [String]()
        
        while array.notEmpty
        {
            let element = array.popFirst()!
            storage.append(element)
        }
        
        assertEquals(storage, original)
        assertEmpty(array)
    }
}

//======================================
//MARK: Equality Tests
//======================================
extension ArraysPlusAlchemyTests
{
    func testEqualityWhenNotEqual()
    {
        XCTAssertFalse(strings == secondStrings)
    }

    func testEqualityWhenShuffled()
    {
        repetitions.repeatBlock {

            let original = strings
            let shuffled = strings.shuffled()

            XCTAssertFalse(original == shuffled)
        }
    }

    func testEqualityWhenNewElementAdded()
    {
        repetitions.repeatBlock {

            let original = strings
            let newString = AlchemyGenerator.alphanumericString()
            let new = strings + [newString]

            XCTAssertFalse(new == original)
        }

    }

    func testEqualityWhenEqual()
    {
        let copy = strings

        XCTAssertTrue(copy == strings)
    }

    func testEqualityWhenEmpty()
    {
        let first = [String]()
        let second = [String]()

        XCTAssertTrue(first == second)
    }

    func testEqualityWithDeepCopy()
    {
        var copy = [String]()

        strings.forEach { copy.append($0) }

        XCTAssertTrue(copy == strings)
    }
}


