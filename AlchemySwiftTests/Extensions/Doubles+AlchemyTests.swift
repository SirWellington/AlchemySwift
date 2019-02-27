//
//  Doubles+AlchemyTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/26/2018.
//  Copyright © 2019 Wellington Moreno. All rights reserved.
//

import AlchemyGenerator
@testable import AlchemySwift
import AlchemyTest
import Foundation
import XCTest

class DoublesPlusAlchemyTests : AlchemyTest
{
    override var iterations: Int { return 200 }

    private var double: Double!

    override func setUp()
    {
        double = AlchemyGenerator.Doubles.any
    }
}


//======================================
// MARK: MATH FUNCTION TESTS
//======================================
extension DoublesPlusAlchemyTests
{
    func testAbsoluteValue()
    {
        repeatTest
        {
            let positive = AlchemyGenerator.positiveDouble()
            assertEquals(positive.abs, positive)

            let negative = AlchemyGenerator.negativeDouble()
            assertEquals(negative.abs, -negative)

            let zero: Double = 0
            assertEquals(zero.abs, 0.0)
        }
    }

}


//======================================
// MARK: DECIMAL PRECISION TESTS
//======================================

extension DoublesPlusAlchemyTests
{
    func testRoundedToWithSimpleExamples()
    {
        // PI = 3.14159265359
        let value = 3.14159265359

        assertEquals(value.rounded(toPlaces: 0), 3.0)
        assertEquals(value.rounded(toPlaces: 1), 3.1)
        assertEquals(value.rounded(toPlaces: 2), 3.14)
        assertEquals(value.rounded(toPlaces: 3), 3.142)
        assertEquals(value.rounded(toPlaces: 4), 3.1416)
        assertEquals(value.rounded(toPlaces: 5), 3.14159)
        assertEquals(value.rounded(toPlaces: 6), 3.141593)
    }

    func testTruncatedToWithSimpleExamples()
    {
        // PI = 3.14159265359
        let value = 3.14159265359

        assertEquals(value.truncated(toPlaces: 0), 3.0)
        assertEquals(value.truncated(toPlaces: 1), 3.1)
        assertEquals(value.truncated(toPlaces: 2), 3.14)
        assertEquals(value.truncated(toPlaces: 3), 3.141)
        assertEquals(value.truncated(toPlaces: 4), 3.1415)
        assertEquals(value.truncated(toPlaces: 5), 3.14159)
        assertEquals(value.truncated(toPlaces: 6), 3.141592)
    }

}


//======================================
// MARK: TIME CONVERSION TESTS
//======================================

extension DoublesPlusAlchemyTests
{

    func testTimeIntervalFromMilliSeconds()
    {
        repeatTest
        {
            let time: TimeInterval = AlchemyGenerator.Doubles.any
            assertEquals(TimeInterval.from(millis: time), time/1000, withMarginOfError: 0.00001)
        }
    }

    func testTimeIntervalFromSeconds()
    {
        repeatTest
        {
            let time: TimeInterval = AlchemyGenerator.Doubles.any
            assertEquals(TimeInterval.from(seconds: time), time)
        }
    }

    func testTimeIntervalFromMinutes()
    {
        assertEquals(TimeInterval.from(minutes: 0.0), 0.0)
        assertEquals(TimeInterval.from(minutes: 0.5), 30.0)
        assertEquals(TimeInterval.from(minutes: 1.0), 60.0)
        assertEquals(TimeInterval.from(minutes: 10.0), 600.0)
    }

    func testTimeIntervalFromHours()
    {
        assertEquals(TimeInterval.from(hours: 0.0), 0.0)
        assertEquals(TimeInterval.from(hours: 0.5), (60.0 * 30.0))
        assertEquals(TimeInterval.from(hours: 1.0), (60.0 * 60.0))
        assertEquals(TimeInterval.from(hours: 10.0), (60.0 * 600.0))
    }

    func testTimeIntervalFromDays()
    {
        assertEquals(TimeInterval.from(days: 0.0), 0.0)
        assertEquals(TimeInterval.from(days: 1.0), TimeInterval.from(hours: 24))
        assertEquals(TimeInterval.from(days: 1.0), (60.0 * 60.0 * 24.0))
        assertEquals(TimeInterval.from(days: 0.5), TimeInterval.from(hours: 12))
        assertEquals(TimeInterval.from(days: 3), TimeInterval.from(hours: 72))
    }

    func testTimeIntervalFromWeeks()
    {
        assertEquals(TimeInterval.from(weeks: 0), 0.0)
        assertEquals(TimeInterval.from(weeks: 1), TimeInterval.from(days: 7))
        assertEquals(TimeInterval.from(weeks: 3), TimeInterval.from(days: 21))
    }

    func testTimeIntervalToMillis()
    {
        assertEquals(0.0.toMillis(), 0.0)
        assertEquals(1.0.toMillis(), 1000.0)
        assertEquals(10.0.toMillis(), 10_000.0)
        assertEquals(0.1.toMillis(), 100.0)
    }

    func testTimeIntervalToSeconds()
    {
        repeatTest
        {
            let time = AlchemyGenerator.doubles(fromInclusive: 0.1, toInclusive: 1000.0)
            assertEquals(time.toSeconds(), time)
        }
    }

    func testTimeIntervalToMinutes()
    {
        repeatTest
        {
            let time = AlchemyGenerator.doubles(fromInclusive: 0.1, toInclusive: 1000.0)
            assertEquals(time.toMinutes(), time / 60.0)
        }
    }

    func testTimeIntervalToHours()
    {
        repeatTest
        {
            let time = AlchemyGenerator.doubles(fromInclusive: 0.1, toInclusive: 1000.0)
            assertEquals(time.toHours(), time / (60.0 * 60.0), withMarginOfError: 0.0000001)
        }
    }

    func testTimeIntervalToDays()
    {
        repeatTest
        {
            let time = AlchemyGenerator.doubles(fromInclusive: 0.1, toInclusive: 1000.0)
            assertEquals(time.toDays(), time.toHours() / 24.0)
        }
    }

    func testTimeIntervalToWeeks()
    {
        repeatTest
        {
            let time = AlchemyGenerator.doubles(fromInclusive: 0.1, toInclusive: 1000.0)
            assertEquals(time.toWeeks(), time.toDays() / 7.0)
        }
    }

}
