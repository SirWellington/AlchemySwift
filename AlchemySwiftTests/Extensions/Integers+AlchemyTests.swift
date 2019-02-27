//
//  Integers+AlchemyTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/22/2018.
//  Copyright © 2019 Wellington Moreno. All rights reserved.
//

import AlchemyGenerator
@testable import AlchemySwift
import AlchemyTest
import Foundation
import XCTest


class IntegersPlusAlchemyTests: AlchemyTest
{
    override var iterations: Int { return 100 }

    private var min = 0
    private var max = 0
    private var array: [String] = []
    private var integer = 0

    override func setUp()
    {
        max = AlchemyGenerator.positiveInteger()
        array = AlchemyGenerator.Arrays.ofAlphabeticString
        integer = AlchemyGenerator.Integers.any
    }

    func testIsEven()
    {
        repeatTest
        {
            let number = AlchemyGenerator.anyInteger()

            let expected = number % 2 == 0
            let result = number.isEven

            assertEquals(result, expected)
        }
    }

    func testIsOdd()
    {
        repeatTest
        {
            let expected = integer % 2 != 0
            let result = integer.isOdd

            assertEquals(result, expected)
        }
    }

    func testRandomInts()
    {
        repeatTest
        {
            let result = Int.randomFrom(minInclusive: min, maxExclusive: max)

            assertThat(result >= min)
            assertThat(result < max)
            assertThat(Int.randomFrom(minInclusive: 0, maxExclusive: 0) == 0)
        }
    }

    func testRandomIntsWithNegatives()
    {
        repeatTest
        {
            min = AlchemyGenerator.negativeInteger()

            let result = Int.randomFrom(minInclusive: min, maxExclusive: max)
            assertTrue(result >= min)
            assertTrue(result < max)
        }
    }

    func testRandomIntsWithInvalidRange()
    {
        repeatTest
        {
            let result = Int.randomFrom(minInclusive: max, maxExclusive: min)
            assertTrue(result >= min)
            assertTrue(result < max)
        }
    }

    func testRandomInt()
    {
        repeatTest
        {
            let result: Int? = Int.random
            assertThat(result != nil)
        }
    }

    func testIsValidIndex()
    {
        repeatTest
        {
            let validIndex = Int.randomFrom(minInclusive: 0, maxExclusive: array.count)

            assertTrue(validIndex.isValidIndex(toArray: array))

            let negativeIndex = AlchemyGenerator.negativeInteger()
            assertFalse(negativeIndex.isValidIndex(toArray: array))

            let invalidIndex = AlchemyGenerator.integer(from: array.count, to: UInt32.max.intValue)
            assertFalse(invalidIndex.isValidIndex(toArray: array))
        }
    }

    func testRepeatBlock()
    {
        repeatTest(15)
        {
            var counter = AlchemyGenerator.Integers.positive
            let iterations = AlchemyGenerator.Integers.positive

            let expected = counter + iterations

            iterations.repeatBlock
            {
                counter += 1
            }

            assertEquals(counter, expected)
        }
    }

    func testRepeatBlockWhenLessThan1()
    {
        repeatTest(10)
        {
            var counter = AlchemyGenerator.integer(from: -1000, to: 0)
            let original = counter

            0.repeatBlock
            {
                counter += 1
            }

            assertEquals(counter, original)
        }
    }
}


//======================================
// MARK: MATH FUNCTION TESTS
//======================================
extension IntegersPlusAlchemyTests 
{
    func testAbsoluteValue()
    {
        repeatTest 
        {
            let positive = AlchemyGenerator.positiveInteger()
            assertEquals(positive.abs, positive)

            let negative = AlchemyGenerator.negativeInteger()
            assertEquals(negative.abs, -negative)

            let zero = 0
            assertEquals(zero.abs, 0)
        }
    }
}
