//
//  Int+AlchemyTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/22/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import AlchemyGenerator
@testable import AlchemySwift
import Foundation
import XCTest


class IntsPlusAlchemyTests: XCTestCase
{

    var min = 0
    var max = 0

    var array: [String] = []

    override func setUp()
    {
        max = AlchemyGenerator.positiveInteger()

        array = AlchemyGenerator.Arrays.ofAlphabeticString
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
        let number = AlchemyGenerator.anyInteger()

        let expected = number % 2 != 0
        let result = number.isOdd

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
extension IntsPlusAlchemyTests
{
    func testAsDouble()
    {
        let int = AlchemyGenerator.anyInteger()
        let expected = Double(int)

        let result = int.asDouble
        assertEquals(result, expected)
    }

    func testDoubleValue()
    {
        let int = AlchemyGenerator.Integers.any
        let expected = Double(int)

        let result = int.doubleValue
        assertEquals(result, expected)
    }
}

