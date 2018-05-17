//
//  AlchemyNumberTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 05/17/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import AlchemyGenerator
@testable import AlchemySwift
import AlchemyTest
import Foundation
import XCTest


//======================================
// MARK: INTEGER TESTS
//======================================
class AlchemyNumberTests: AlchemyTest
{
    private var int: Int = 0
    private var int32: Int32 = 0
    private var int64: Int64 = 0
    private var uInt: UInt = 0
    private var uInt32: UInt32 = 0
    private var uInt64: UInt64 = 0
    private var double: Double = 0.0
    private var float: Float = 0.0
    private var cgFloat: CGFloat = 0.0

    private var anyPositiveInt: Int { return AlchemyGenerator.Integers.positive }
    private var anyPositiveDouble: Double { return AlchemyGenerator.Doubles.positive }

    override func beforeEachTest()
    {
        double = anyPositiveDouble
        int = Int(double)
        int32 = Int32(double)
        int64 = Int64(double)
        uInt = UInt(double)
        uInt32 = UInt32(double)
        uInt64 = UInt64(double)
        float = Float(double)
        cgFloat = CGFloat(double)
    }

    func testInt()
    {
        repeatTest
        {
            assertEquals(int.intValue, int)
            assertEquals(int.int32Value, int32)
            assertEquals(int.int64Value, int64)
            assertEquals(int.uIntValue, uInt)
            assertEquals(int.uInt32Value, uInt32)
            assertEquals(int.uInt64Value, uInt64)
            assertEquals(int.cgFloatValue, floor(cgFloat))
            assertEquals(int.floatValue, floor(float))
            assertEquals(int.doubleValue, floor(double))
            assertEquals(int.stringValue, String(int))
        }
    }

    func testInt32()
    {
        repeatTest
        {
            assertEquals(int32.intValue, int)
            assertEquals(int32.int32Value, int32)
            assertEquals(int32.int64Value, int64)
            assertEquals(int32.uIntValue, uInt)
            assertEquals(int32.uInt32Value, uInt32)
            assertEquals(int32.uInt64Value, uInt64)
            assertEquals(int32.cgFloatValue, floor(cgFloat))
            assertEquals(int32.floatValue, floor(float))
            assertEquals(int32.doubleValue, floor(double))
            assertEquals(int32.stringValue, String(int))
        }
    }

    func testDouble()
    {
        repeatTest
        {
            assertEquals(double.doubleValue, double)
            assertEquals(double.intValue, int)
            assertEquals(double.int32Value, int32)
            assertEquals(double.int64Value, int64)
            assertEquals(double.uIntValue, uInt)
            assertEquals(double.uInt32Value, uInt32)
            assertEquals(double.uInt64Value, uInt64)
            assertEquals(double.floatValue, float)
            assertEquals(double.cgFloatValue, cgFloat)
            assertEquals(double.stringValue, String(double))
        }
    }

}
