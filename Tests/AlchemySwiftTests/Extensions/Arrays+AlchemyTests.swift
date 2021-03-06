    //
//  Arrays+AlchemyTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/22/2018.
//  Copyright © 2019 Wellington Moreno. All rights reserved.
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
    override var iterations: Int { return 100 }

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
        repeatTest
        {
            assertEquals(strings.size, strings.count)
        }
    }

    func testAnyElement()
    {
        let emptyArray = [String]()
        assertNil(emptyArray.anyElement)

        repeatTest
        {
            let result: String! = strings.anyElement
            assertNotNil(result)
            assertTrue(strings.contains(result))
        }
    }

    func testShuffle()
    {
        repeatTest
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
        repeatTest
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
        repeatTest
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
        repeatTest
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
        repeatTest
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
        repeatTest
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
        repeatTest
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
// MARK: REMOVING ELEMENTS
//======================================
extension ArraysPlusAlchemyTests
{
    func testRemoveElementsWithEmpty()
    {
        repeatTest
        {
            let original = strings
            strings.removeElements([])
            assertEquals(strings, original)
        }

    }
    
    func testRemoveElements()
    {
        repeatTest
        {
            let first = strings.first!
            let last = strings.last!
            let expected = strings[1..<strings.size-1].toArray()
            strings.removeElements([first, last])
            assertEquals(strings, expected)
        }
    }
    
    func testRemoveWhere()
    {
        repeatTest
        {
            let expected = strings
            strings.removeWhere {_ in false }
            assertEquals(strings, expected)
        }
        
        repeatTest
        {
            let expected: [String] = []
            strings.removeWhere {_ in true }
            assertEquals(strings, expected)
        }
        
        repeatTest
        {
            let expected = strings
            let newString = self.anyString
            strings.add(newString)
            strings.removeWhere { $0 == newString }
            assertEquals(strings, expected)
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
        repeatTest
        {
            var empty = [String]()
            assertNil(empty.circulateNextSafe())
        }
    }

    func testCirculatePreviousSafe()
    {
        repeatTest
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
        repeatTest
        {
            let original = strings
            let shuffled = strings.shuffled()

            assertNotEquals(original, shuffled)
        }
    }

    func testEqualityWhenNewElementAdded()
    {
        repeatTest
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
        repeatTest
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

    func testDoesNotContain()
    {
        let element = strings.anyElement!
        
        assertFalse(strings.doesNotContain(element))
        
        let randomString = AlchemyGenerator.alphabeticString()
        assertTrue(strings.doesNotContain(randomString))
    }
    
    func testCountWhere()
    {
        repeatTest
        {
            let count = strings.countWhere  { _ in true }
            assertEquals(count, strings.size)
        }
    }

    func testCountWhereWhenNone()
    {
        repeatTest
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

    func testDistinct()
    {
        let array = (strings + strings).shuffled()
        let result = array.distinct()
        
        assertEquals(result.size, strings.size)
        result.forEach { assertTrue(array.contains($0)) }
        array.forEach { assertTrue(result.contains($0)) }
    }
    
    func testDistinctWhenSameElement()
    {
        let value = AlchemyGenerator.alphabeticString()
        let array = AlchemyGenerator.Arrays.of(size: 10, { value })
        let expected = [value]
        
        let result = array.distinct()
        assertEquals(result, expected)
    }
    
    func testDistinctWithDifferentElements()
    {
        let array = self.strings
        let expected = self.strings
        
        let result = array.distinct()
        assertEquals(result, expected)
    }
    
    func testUnique()
    {
        let array = (strings + strings).shuffled()
        let result = array.unique()
        
        assertEquals(result.size, strings.size)
        result.forEach { assertTrue(array.contains($0)) }
        array.forEach { assertTrue(result.contains($0)) }
    }
    
    func testUniqueWhenDuplicatedElement()
    {
        let value = AlchemyGenerator.alphabeticString()
        let array = AlchemyGenerator.Arrays.of(size: 20, { value })
        let expected = [value]
        
        let result = array.unique()
        assertEquals(result, expected)
    }
    
    func testUniqueWhenDifferentElements()
    {
        let array = strings
        let expected = array
        
        let result = array.unique()
        
        assertEquals(result, expected)
    }
    
    
    func testUniqueOn()
    {
        repeatTest
        {
            let array = AlchemyGenerator.Arrays.ofAlphabeticString
            let result = array.unique { $0.firstLetter! }

            let mappedByFirstLetter = array.reduce(into: [String: Int]())
            {
                let existingCount = $0[$1] ?? 0
                $0[$1] = existingCount + 1
            }
            
        }
    }

    func testUniqueOnWhenTheSame()
    {
        repeatTest
        {
            let stringSize = Int.randomFrom(minInclusive: 5, maxExclusive: 20)
            let generator = { return AlchemyGenerator.alphabeticString(ofSize: stringSize) }
            let array = AlchemyGenerator.Arrays.of(size: 10, generator)

            let result = array.unique { $0.length }
            assertEquals(result.size, 1)
            assertTrue(array.contains(result.first!))
        }
    }

    func testUniqueOnWhenDifferent()
    {
        repeatTest
        {
            let array = AlchemyGenerator.Arrays.ofAlphabeticString
            let result = array.unique { $0.hashValue }

            //Should be true most of the time
            var expected = [String]()
            array.forEach
            {
                if expected.doesNotContain($0)
                {
                    expected.add($0)
                }
            }

            assertEquals(result, expected)
        }
    }

}

//======================================
// MARK: ARRAY SLICE TESTS
//======================== ==============
extension ArraysPlusAlchemyTests
{
    func testArraySliceToArray()
    {
        repeatTest
        {
            let slice = strings[0..<strings.size]
            let result = slice.toArray()
            assertEquals(result, strings)
        }
    }
}


//======================================
// MARK: EQUATABLE TESTS
//======================================
extension ArraysPlusAlchemyTests
{

    func testIsInWhenNotIn()
    {
        repeatTest
        {
            let string = anyString

            assertFalse(string.isIn(self.strings))
            assertFalse(string.isIn([]))
        }
    }

    func testIsInWhenIsIn()
    {
        repeatTest
        {
            let anyString = strings.anyElement!

            assertTrue(anyString.isIn(strings))
            assertTrue(anyString.isIn([anyString]))
        }
    }

    func testIsNotInWhenNotIn()
    {
        repeatTest
        {
            let string = anyString
            assertTrue(string.isNotIn([]))

            let list = strings
            assertTrue(string.isNotIn(list))
        }
    }

    func testIsNotInWhenIsIn()
    {
        repeatTest
        {
            let string = anyString
            let list = (strings + [string]).shuffled()
            assertFalse(string.isNotIn([string]))
            assertFalse(string.isNotIn(list))
        }
    }

}
