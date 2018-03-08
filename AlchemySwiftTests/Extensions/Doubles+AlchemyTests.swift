//
//  Doubles+AlchemyTests.swift
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

class DoublesPlusAlchemyTests : XCTestCase
{

    private var double: Double!

    override func setUp()
    {
        double = AlchemyGenerator.Doubles.any
    }

    func testAsInt()
    {
        let expected = Int(double)
        let result = double.asInt

        assertEquals(result, expected)
    }

    func testIntValue()
    {
        let expected = Int(double)
        let result = double.intValue

        assertEquals(result, expected)
    }

    func testAsString()
    {
        let expected = "\(double!)"
        let result = double.asString

        assertEquals(result, expected)
    }

    func testTimeIntervalFromMilliSeconds()
    {
        100.repeatBlock
        {
            let time: TimeInterval = AlchemyGenerator.Doubles.any
            assertEquals(TimeInterval.from(millis: time), time/1000, withMarginOfError: 0.00001)
        }
    }

    func testTimeIntervalFromSeconds()
    {
        100.repeatBlock
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
        100.repeatBlock
        {
            let time = AlchemyGenerator.doubles(fromInclusive: 0.1, toInclusive: 1000.0)
            assertEquals(time.toSeconds(), time)
        }
    }

    func testTimeIntervalToMinutes()
    {
        100.repeatBlock
        {
            let time = AlchemyGenerator.doubles(fromInclusive: 0.1, toInclusive: 1000.0)
            assertEquals(time.toMinutes(), time / 60.0)
        }
    }

    func testTimeIntervalToHours()
    {
        100.repeatBlock
        {
            let time = AlchemyGenerator.doubles(fromInclusive: 0.1, toInclusive: 1000.0)
            assertEquals(time.toHours(), time / (60.0 * 60.0), withMarginOfError: 0.0000001)
        }
    }

    func testTimeIntervalToDays()
    {
        100.repeatBlock
        {
            let time = AlchemyGenerator.doubles(fromInclusive: 0.1, toInclusive: 1000.0)
            assertEquals(time.toDays(), time.toHours() / 24.0)
        }
    }


    func testTimeIntervalToWeeks()
    {
        100.repeatBlock
        {
            let time = AlchemyGenerator.doubles(fromInclusive: 0.1, toInclusive: 1000.0)
            assertEquals(time.toWeeks(), time.toDays() / 7.0)
        }
    }

}
