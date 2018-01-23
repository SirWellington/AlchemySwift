//
//  TestFunctions.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/22/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import Foundation
import XCTest


func assertEquals<T: Equatable>(_ first: T?, _ second: T?, _ file: StaticString = #file, _ line: UInt = #line)
{
    XCTAssertEqual(first, second, file: file, line: line)
}

func assertThat(_ condition: Bool, _ file: StaticString = #file, _ line: UInt = #line)
{
    XCTAssert(condition, file: file, line: line)
}