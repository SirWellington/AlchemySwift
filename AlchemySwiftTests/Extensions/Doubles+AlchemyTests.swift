//
//  Doubles+AlchemyTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/26/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import AlchemyGenerator
@testable import AlchemySwift
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
}
