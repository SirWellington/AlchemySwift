//
//  Arrays+AlchemyTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/22/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import AlchemyGenerator
@testable
import AlchemySwift
import AlchemyTest
import Foundation


//======================================
// MARK: CONVENIENCE METHOD TESTS
//======================================
class ArraysPlusAlchemyTests: AlchemyTest
{
    private var anyString: String { return AlchemyGenerator.Strings.alphanumeric }
    private var strings: [String] = []
    private var secondStrings: [String] = []
    private var numbers: [Int] = []

    override func beforeEachTest()
    {
        strings = AlchemyGenerator.array { AlchemyGenerator.Strings.alphabetic }
        secondStrings = AlchemyGenerator.array { AlchemyGenerator.alphanumericString() }
        numbers = AlchemyGenerator.array { AlchemyGenerator.anyInteger() }
    }

    func testNotEmpty()
    {
        let emptyArray = [String]()
        assertFalse(emptyArray.notEmpty)
        assertTrue(strings.notEmpty)
    }
    
    func testSize()
    {
        runTest
        {
            assertEquals(strings.size, strings.count)
        }
    }

    func testAnyElement()
    {
        let emptyArray = [String]()
        assertNil(emptyArray.anyElement)

        runTest
        {
            let result: String! = strings.anyElement
            assertNotNil(result)
            assertTrue(strings.contains(result))
        }
    }

    func testShuffle()
    {
        runTest
        {
            let result = strings.shuffled()

            assertTrue(result != strings)
            assertEquals(result.size, strings.size)

            for string in result
            {
                assertTrue(result.contains(string))
            }
        }
    }

    func testIsValidIndex()
    {
        let validIndex = AlchemyGenerator.integer(from: 0, to: strings.size)

        assertTrue(strings.isValidIndex(validIndex))

        let negativeIndex = AlchemyGenerator.negativeInteger()
        assertFalse(strings.isValidIndex(negativeIndex))

        let invalidIndex = AlchemyGenerator.integer(from: strings.count, to: UInt32.max.intValue)
        assertFalse(strings.isValidIndex(invalidIndex))
    }

    func testAnyElementInRange()
    {
        runTest
        {
            let min = 0
            let max = Int.randomFrom(minInclusive: 1, maxExclusive: 1_000)
            let range = min..<max

            let result = range.anyElement!
            assertTrue(result >= min)
            assertTrue(result  < max)
        }
    }

    func testPrepend()
    {
        runTest
        {
            let newString = self.anyString

            let expected = [newString] + strings
            strings.prepend(newString)

            assertEquals(strings, expected)
        }
    }

    func testPrependWhenEmpty()
    {
        var array = [String]()
        let newElement = anyString
        let expected = [newElement]

        array.prepend(newElement)
        assertEquals(array, expected)
    }

    func testPrependMultipleTimes()
    {
        runTest
        {
            let elementsToPrepend = AlchemyGenerator.Arrays.ofAlphanumericString
            let expected = elementsToPrepend.reversed() + strings

            elementsToPrepend.forEach
            {
                strings.prepend($0)
            }

            assertEquals(strings, expected)
        }
    }
    
    func testAdd()
    {
        runTest
        {
            var array = strings
            let newItem = anyString

            let expected = strings + [newItem]

            array.add(newItem)
            assertEquals(array, expected)
        }
        
    }
    
    func testPopFirst()
    {
        runTest
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
    }
    
    func testPopFirstOnEmptyArray()
    {
        var array = [String]()
        
        let result = array.popFirst()
        assertNil(result)
    }
    
    func testPopFirstOnEntireArray()
    {
        runTest
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
}

//======================================
// MARK: CIRCULATION TESTS
//======================================
extension ArraysPlusAlchemyTests
{
    func testCirculateNext()
    {
        let range = (0...99)
        var numbers = Array(range)

        var result = [Int]()

        for i in range
        {
            let expected = i
            let next = numbers.circulateNext()
            assertEquals(next, expected)
            assertEquals(numbers.size, range.count)
            assertEquals(numbers.last!, next)
        }
    }

    func testCirculatePrevious()
    {
        let range = (0...99)
        var numbers = Array(range)
        let size = numbers.size

        for i in range
        {
            let expected = numbers.last!
            let result = numbers.circulatePrevious()
            assertEquals(result, expected)
            assertEquals(numbers.size, range.count)
            assertEquals(numbers.first!, result)
        }
    }

    func testCirculateNextSafe()
    {
        runTest
        {
            var empty = [String]()
            assertNil(empty.circulateNextSafe())
        }
    }

    func testCirculatePreviousSafe()
    {
        runTest
        {
            var empty = [String]()
            assertNil(empty.circulatePreviousSafe())
        }
    }
}


//======================================
//MARK: EQUALITY TESTS
//======================================
extension ArraysPlusAlchemyTests
{
    func testEqualityWhenNotEqual()
    {
        assertFalse(strings == secondStrings)
    }

    func testEqualityWhenShuffled()
    {
        runTest
        {

            let original = strings
            let shuffled = strings.shuffled()

            assertFalse(original == shuffled)
        }
    }

    func testEqualityWhenNewElementAdded()
    {
        runTest
        {

            let original = strings
            let newString = AlchemyGenerator.alphanumericString()
            let new = strings + [newString]

            assertFalse(new == original)
        }

    }

    func testEqualityWhenEqual()
    {
        let copy = strings

        assertTrue(copy == strings)
    }

    func testEqualityWhenEmpty()
    {
        let first = [String]()
        let second = [String]()

        assertTrue(first == second)
    }

    func testEqualityWithDeepCopy()
    {
        runTest
        {
            var copy = [String]()

            strings.forEach
            {
                copy.append($0)
            }

            assertTrue(copy == strings)
        }

    }
}


//======================================
//MARK: SEQUENCE TESTS
//======================================
extension ArraysPlusAlchemyTests
{

    func testCountWhere()
    {
        runTest
        {
            let count = strings.countWhere  { _ in true }
            assertEquals(count, strings.size)
        }
    }

    func testCountWhereWhenNone()
    {
        runTest
        {
            let count = strings.countWhere  { _ in false }
            assertTrue(count == 0)
        }
    }

    func testRepeatBlock()
    {
        var counter = 0
        let block =
        {
            counter += 1
        }

        (1...100).repeatBlock(block)

        assertTrue(counter == 100)
    }

    func testOnEach()
    {
        var counter = 0
        let size = AlchemyGenerator.integer(from: 10, to: 100)
        let array = Array(repeating: 2, count: size)

        let result = array.onEach { counter += $0 }
        
        assertEquals(counter, size * 2)
        assertEquals(result, array)
    }

}