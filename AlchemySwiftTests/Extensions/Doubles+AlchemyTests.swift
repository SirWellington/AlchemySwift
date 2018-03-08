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
            assertEquals(time.fromMilliseconds, time/1000, withMarginOfError: 0.00001)
        }
    }

    func testTimeIntervalFromSeconds()
    {
        100.repeatBlock
        {
            let time: TimeInterval = AlchemyGenerator.Doubles.any
            assertEquals(time.fromSeconds, time)
        }
    }

    func testTimeIntervalFromMinutes()
    {
        assertEquals(0.0.fromMinutes, 0.0)
        assertEquals(0.5.fromMinutes, 30.0)
        assertEquals(1.0.fromMinutes, 60.0)
        assertEquals(10.0.fromMinutes, 600.0)
    }

    func testTimeIntervalFromHours()
    {
        assertEquals(0.0.fromHours, 0.0)
        assertEquals(0.5.fromHours, (60.0 * 30.0))
        assertEquals(1.0.fromHours, (60.0 * 60.0))
        assertEquals(10.0.fromHours, (60.0 * 600.0))
    }

    func testTimeIntervalFromDays()
    {
        assertEquals(0.0.fromDays, 0.0)
        assertEquals(1.0.fromDays, 24.hours)
        assertEquals(1.0.fromDays, (60.0 * 24.0).fromMinutes)
        assertEquals(0.5.fromDays, 12.hours)
        assertEquals(3.fromDays, 72.hours)
    }

    func testTimeIntervalFromWeeks()
    {
        assertEquals(0.0.fromWeeks, 0.0)
        assertEquals(1.fromWeeks, 7.days)
        assertEquals(3.fromWeeks, 21.days)
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
