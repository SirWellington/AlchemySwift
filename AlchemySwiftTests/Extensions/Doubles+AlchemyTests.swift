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

    func testTimeIntervalMilliSeconds()
    {
        100.repeatBlock
        {
            let time: TimeInterval = AlchemyGenerator.Doubles.any
            assertEquals(time.milliseconds, time/1000, withMarginOfError: 0.00001)
        }
    }

    func testTimeIntervalSeconds()
    {
        100.repeatBlock
        {
            let time: TimeInterval = AlchemyGenerator.Doubles.any
            assertEquals(time.seconds, time)
        }
    }

    func testTimeIntervalMinutes()
    {
        assertEquals(0.0.minutes, 0.0)
        assertEquals(0.5.minutes, 30.0)
        assertEquals(1.0.minutes, 60.0)
        assertEquals(10.0.minutes, 600.0)
    }

    func testTimeIntervalHours()
    {
        assertEquals(0.0.hours, 0.0)
        assertEquals(0.5.hours, (60.0 * 30.0))
        assertEquals(1.0.hours, (60.0 * 60.0))
        assertEquals(10.0.hours, (60.0 * 600.0))
    }

    func testTimeIntervalDays()
    {
        assertEquals(0.0.days, 0.0)
        assertEquals(1.0.days, 24.hours)
        assertEquals(1.0.days, (60.0 * 24.0).minutes)
        assertEquals(0.5.days, 12.hours)
        assertEquals(3.days, 72.hours)
    }

    func testTimeIntervalWeeks()
    {
        assertEquals(0.0.weeks, 0.0)
        assertEquals(1.weeks, 7.days)
        assertEquals(3.weeks, 21.days)
    }

    func testTimeIntervalToMillis()
    {
        assertEquals(0.0.toMillis, 0.0)
        assertEquals(1.0.toMillis, 1000.0)
        assertEquals(10.0.toMillis, 10_000.0)
        assertEquals(0.1.toMillis, 100.0)
    }

    func testTimeIntervalToSeconds()
    {
        100.repeatBlock
        {
            let time = AlchemyGenerator.doubles(fromInclusive: 0.1, toInclusive: 1000.0)
            assertEquals(time.toSeconds, time)
        }
    }

    func testTimeIntervalToMinutes()
    {
        100.repeatBlock
        {
            let time = AlchemyGenerator.doubles(fromInclusive: 0.1, toInclusive: 1000.0)
            assertEquals(time.toMinutes, time / 60.0)
        }
    }

    func testTimeIntervalToHours()
    {
        100.repeatBlock
        {
            let time = AlchemyGenerator.doubles(fromInclusive: 0.1, toInclusive: 1000.0)
            assertEquals(time.toHours, time / (60.0 * 60.0), withMarginOfError: 0.0000001)
        }
    }

    func testTimeIntervalToDays()
    {
        100.repeatBlock
        {
            let time = AlchemyGenerator.doubles(fromInclusive: 0.1, toInclusive: 1000.0)
            assertEquals(time.toDays, time.toHours / 24.0)
        }
    }


    func testTimeIntervalToWeeks()
    {
        100.repeatBlock
        {
            let time = AlchemyGenerator.doubles(fromInclusive: 0.1, toInclusive: 1000.0)
            assertEquals(time.toWeeks, time.toDays / 7.0)
        }
    }

}
