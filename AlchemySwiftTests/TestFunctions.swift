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

func assertNotNil<T: Equatable>(_ reference: T?,  file: StaticString = #file, line: UInt = #line)
{
    assertTrue(reference != nil, file: file, line: line)
}

func assertNil<T: Equatable>(_ reference: T?, file: StaticString = #file, line: UInt = #line)
{
    assertTrue(reference == nil, file: file, line: line)
}

