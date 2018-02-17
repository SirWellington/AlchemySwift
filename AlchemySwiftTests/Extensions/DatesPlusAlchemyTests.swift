//
//  DatesPlusAlchemyTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 02/07/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//


import AlchemyGenerator
@testable import AlchemySwift
import AlchemyTest
import Foundation
import XCTest


//======================================
// MARK: Tests
//======================================
class DatesPlusAlchemyTests: XCTestCase
{

    private var testIterations =  100
    
    private var now: Date { return Date() }
    private var seconds: TimeInterval { return AlchemyGenerator.doubles(fromInclusive: 1.0, toInclusive: 10.0.days) }
    private var dateInThePast: Date { return now.subtractingTimeInterval(seconds) }
    private var dateInTheFuture: Date { return now.addingTimeInterval(seconds) }
    
    func testIsInThePast()
    {
        testIterations.repeatBlock
        {
            let pastDate = self.dateInThePast
            let futureDate = self.dateInTheFuture
            
            assertTrue(pastDate.isInThePast)
            assertFalse(futureDate.isInThePast)
        }
    }
    
    func testIsInTheFuture()
    {
        testIterations.repeatBlock
        {
            let pastDate = self.dateInThePast
            let futureDate = self.dateInTheFuture
            
            assertTrue(futureDate.isInTheFuture)
            assertFalse(pastDate.isInTheFuture	)
        }
    }

    func testDateBySubtracting()
    {
        testIterations.repeatBlock
        {
            let date = Date()

            let timeToSubtract = AlchemyGenerator.doubles(fromInclusive: 100, toInclusive: 100_000)
            let expectedEpochTime = date.timeIntervalSince1970 - timeToSubtract
            let expectedDate = Date(timeIntervalSince1970: expectedEpochTime)

            let result = date.subtractingTimeInterval(timeToSubtract)

            assertEquals(result, expectedDate, withMarginOfError: 0.00001)
        }
    }

    
    func testIsBefore()
    {
        testIterations.repeatBlock
        {
            let pastDate = self.dateInThePast
            let futureDate = self.dateInTheFuture
            
            assertTrue(pastDate.isBefore(date: now))
            assertFalse(futureDate.isBefore(date: now))
            assertTrue(pastDate.isBefore(date: futureDate))
            assertFalse(futureDate.isBefore(date: pastDate))
        }
    }

    func testIsAfter()
    {
        testIterations.repeatBlock
        {
            let now = self.now
            let pastDate = self.dateInThePast
            let futureDate = self.dateInTheFuture
            
            assertTrue(now.isAfter(date: pastDate))
            assertTrue(futureDate.isAfter(date: now))
            assertTrue(futureDate.isAfter(date: pastDate))
            
            assertFalse(pastDate.isAfter(date: futureDate))
            assertFalse(pastDate.isAfter(date: now))
            assertFalse(now.isAfter(date: futureDate))
        }
    }
    
    func testDateFormatter()
    {
        testIterations.repeatBlock
        {
            _testDateFormatterWithFormat("MM/dd/yyyy")
            _testDateFormatterWithFormat("yyyy.MM.dd")
            _testDateFormatterWithFormat("E, MMM d yyyy")
        }
    }

    private func _testDateFormatterWithFormat(_ format: String)
    {
        let date = Date()

        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateFormat = format

        let expected = formatter.string(from: date)
        let result = date.formatTo(dateFormat: format)

        assertEquals(result, expected)
    }
}
