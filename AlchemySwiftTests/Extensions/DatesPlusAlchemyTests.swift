//
//  DatesPlusAlchemyTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 02/07/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//


import AlchemyGenerator
@testable import AlchemySwift
import Foundation
import XCTest


//======================================
// MARK: Tests
//======================================
class DatesPlusAlchemyTests: XCTestCase
{

    private var testIterations =  100

    private var date: Date = Date()

    func testDateBySubtracting()
    {
        testIterations.repeatBlock
        {
            let timeToSubtract = AlchemyGenerator.doubles(fromInclusive: 100, toInclusive: 100_000)
            let expectedEpochTime = date.timeIntervalSince1970 - timeToSubtract
            let expectedDate = Date(timeIntervalSince1970: expectedEpochTime)

            let result = date.subtractingTimeInterval(timeToSubtract)

            assertEquals(result, expectedDate, marginOfError: 0.00001)
        }
    }
}
