//
//  TestFunctions.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/22/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import Foundation
import XCTest


func assertEquals<T: Equatable>(_ first: T?, _ second: T?, file: StaticString = #file, line: UInt = #line)
{
    XCTAssertEqual(first, second, file: file, line: line)
}

func assertEquals(_ first: Double, _ second: Double, marginOfError: Double = 0.0)
{
    XCTAssertEqual(first, second, accuracy: marginOfError)
}

func assertEquals(_ first: Date, _ second: Date, marginOfError: TimeInterval = 0.0)
{
    XCTAssertEqual(first.timeIntervalSince1970, second.timeIntervalSince1970, accuracy: marginOfError)
}

func assertThat(_ condition: Bool, file: StaticString = #file, line: UInt = #line)
{
    XCTAssert(condition, file: file, line: line)
}

func assertTrue(_ condition: Bool, file: StaticString = #file, line: UInt = #line)
{
    assertThat(condition, file: file, line: line)
}

func assertFalse(_ condition: Bool, file: StaticString = #file, line: UInt = #line)
{
    XCTAssertFalse(condition, file: file, line: line)
}

func assertNotEquals<T: Equatable>(_ first: T?, _ second: T?, file: StaticString = #file, line: UInt = #line)
{
    XCTAssertNotEqual(first, second, file: file, line: line)
}

func assertNotNil<T: Equatable>(_ reference: T?, file: StaticString = #file, line: UInt = #line)
{
    assertTrue(reference != nil, file: file, line: line)
}

func assertNil<T: Equatable>(_ reference: T?, file: StaticString = #file, line: UInt = #line)
{
    assertTrue(reference == nil, file: file, line: line)
}

private extension Optional
{
    var toString: String
    {
        switch self
        {
            case .some(let value): return String(describing: value)
            case .none: return "nil"
        }
    }
}
