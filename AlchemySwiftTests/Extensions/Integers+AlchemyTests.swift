//
//  Integers+AlchemyTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/22/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import AlchemyGenerator
@testable import AlchemySwift
import Foundation
import XCTest


class IntegersPlusAlchemyTests: XCTestCase
{

    fileprivate var min = 0
    fileprivate var max = 0
    fileprivate var array: [String] = []
    fileprivate var integer = 0

    override func setUp()
    {
        max = AlchemyGenerator.positiveInteger()
        array = AlchemyGenerator.Arrays.ofAlphabeticString
        integer = AlchemyGenerator.Integers.any
    }

    func testIsEven()
    {
        let number = AlchemyGenerator.anyInteger()

        let expected = number % 2 == 0
        let result = number.isEven

        assertEquals(result, expected)
    }

    func testIsOdd()
    {
        let expected = integer % 2 != 0
        let result = integer.isOdd

        assertEquals(result, expected)
    }

    func testRandomInts()
    {
        let result = Int.randomFrom(minInclusive: min, maxExclusive: max)

        assertThat(result >= min)
        assertThat(result < max)

        assertThat(Int.randomFrom(minInclusive: 0, maxExclusive: 0) == 0)
    }

    func testRandomIntsWithNegatives()
    {
        min = AlchemyGenerator.negativeInteger()

        let result = Int.randomFrom(minInclusive: min, maxExclusive: max)
        XCTAssertTrue(result >= min)
        XCTAssertTrue(result < max)
    }

    func testRandomIntsWithInvalidRange()
    {
        let result = Int.randomFrom(minInclusive: max, maxExclusive: min)
        XCTAssertTrue(result >= min)
        XCTAssertTrue(result < max)
    }

    func testRandomInt()
    {
        let result: Int? = Int.random

        assertThat(result != nil)
    }

    func testIsValidIndex()
    {
        let validIndex = Int.randomFrom(minInclusive: 0, maxExclusive: array.count)

        XCTAssertTrue(validIndex.isValidIndex(toArray: array))

        let negativeIndex = AlchemyGenerator.negativeInteger()
        XCTAssertFalse(negativeIndex.isValidIndex(toArray: array))

        let invalidIndex = AlchemyGenerator.integer(from: array.count, to: UInt32.max.intValue)
        XCTAssertFalse(invalidIndex.isValidIndex(toArray: array))
    }

    func testRepeatBlock()
    {
        var counter = AlchemyGenerator.Integers.positive
        let iterations = AlchemyGenerator.Integers.positive

        let expected = counter + iterations

        iterations.repeatBlock
        {
            counter += 1
        }

        XCTAssertEqual(counter, expected)
    }

    func testRepeatBlockWhenLessThan1()
    {
        var counter = AlchemyGenerator.integer(from: -1000, to: 0)
        let original = counter

        0.repeatBlock
        {
            counter += 1
        }

        XCTAssertEqual(counter, original)
    }
}

//=====================================
//MARK: Conversion Tests
//=====================================
extension IntegersPlusAlchemyTests
{
    func testAsDouble()
    {
        let expected = Double(integer)

        let result = integer.asDouble
        assertEquals(result, expected)
    }

    func testDoubleValue()
    {
        let expected = Double(integer)

        let result = integer.doubleValue
        assertEquals(result, expected)
    }

    func testAsString()
    {
        let expected = "\(integer)"
        let result = integer.asString

        assertEquals(result, expected)
    }

    func testAsUInt()
    {
        integer = AlchemyGenerator.positiveInteger()
        assertEquals(integer.asUInt, UInt(integer))
    }

    func testAsUInt32()
    {
        integer = AlchemyGenerator.positiveInteger()
        assertEquals(integer.asUInt32, UInt32(integer))
        assertEquals(integer.uInt32, UInt32(integer))
    }

}
