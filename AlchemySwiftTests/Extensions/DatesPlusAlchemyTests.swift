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
class DatesPlusAlchemyTests: AlchemyTest
{

    private var testIterations =  100
    private let calendar = Calendar.autoupdatingCurrent
    
    private var now: Date { return Date() }
    private var seconds: TimeInterval { return AlchemyGenerator.doubles(fromInclusive: 1.0, toInclusive: TimeInterval.from(days: 10.0)) }
    private var dateInThePast: Date { return now.subtractingTimeInterval(seconds) }
    private var dateInTheFuture: Date { return now.addingTimeInterval(seconds) }
    
    func testIsInThePast()
    {
        runTest(iterations: testIterations)
        {
            let pastDate = self.dateInThePast
            let futureDate = self.dateInTheFuture
            
            assertTrue(pastDate.isInThePast)
            assertFalse(futureDate.isInThePast)
        }
    }
    
    func testIsInTheFuture()
    {
        runTest(iterations: testIterations)
        {
            let pastDate = self.dateInThePast
            let futureDate = self.dateInTheFuture
            
            assertTrue(futureDate.isInTheFuture)
            assertFalse(pastDate.isInTheFuture	)
        }
    }

    func testDateBySubtracting()
    {
        runTest(iterations: testIterations)
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
        runTest(iterations: testIterations)
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
        runTest(iterations: testIterations)
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
        runTest(iterations: testIterations)
        {
            _testDateFormatterWithFormat("MM/dd/yyyy")
            _testDateFormatterWithFormat("yyyy.MM.dd")
            _testDateFormatterWithFormat("E, MMM d yyyy")
        }
    }

    private func _testDateFormatterWithFormat(_ format: String)
    {
        runTest(iterations: testIterations)
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

    func testYearsAgo()
    {
        runTest(iterations: testIterations)
        {
            let yearsAgo = AlchemyGenerator.integer(from: 0, to: 100)
            let now = Date()
            let date = calendar.date(byAdding: .year, value: -yearsAgo, to: now)!

            let result = date.yearsAgo
            assertEquals(result, yearsAgo)
        }
    }

    func testYearsAgoWithFutureDate()
    {
        runTest(iterations: testIterations)
        {
            let yearsAhead = AlchemyGenerator.integer(from: 0, to: 100)
            let now = Date()
            var date = calendar.date(byAdding: .year, value: yearsAhead, to: now)!
            //Adjust for a couple of millis of computation time
            date = date.addingTimeInterval(1.0)

            let result = date.yearsAgo
            assertEquals(result, -yearsAhead)
        }
    }

    func testMonthsAgo()
    {
        runTest(iterations: testIterations)
        {
            let monthsAgo = AlchemyGenerator.integer(from: 0, to: 200)
            let now = Date()
            let date = calendar.date(byAdding: .month, value: -monthsAgo, to: now)!

            let result = date.monthsAgo
            assertEquals(result, monthsAgo)
        }
    }

    func testMonthsAgoWithFutureDate()
    {
        runTest(iterations: testIterations)
        {
            let monthsAhead = AlchemyGenerator.integer(from: 0, to: 200)
            let now = Date()
            var date = calendar.date(byAdding: .month, value: monthsAhead, to: now)!
            //Adjust for computation time
            date = date.addingTimeInterval(1.0)

            let result = date.monthsAgo
            assertEquals(result, -monthsAhead)
        }
    }
}
