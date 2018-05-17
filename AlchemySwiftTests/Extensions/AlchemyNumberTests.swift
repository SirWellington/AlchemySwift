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

    private var anyPositiveInt: Int
    {
        return AlchemyGenerator.Integers.positive
    }
    private var anyPositiveDouble: Double
    {
        return AlchemyGenerator.Doubles.positive
    }

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
            assertEquals(int32.stringValue, String(int32))
        }
    }

    func testInt64()
    {
        repeatTest
        {
            assertEquals(int64.intValue, int)
            assertEquals(int64.int32Value, int32)
            assertEquals(int64.int64Value, int64)
            assertEquals(int64.uIntValue, uInt)
            assertEquals(int64.uInt32Value, uInt32)
            assertEquals(int64.uInt64Value, uInt64)
            assertEquals(int64.cgFloatValue, floor(cgFloat))
            assertEquals(int64.floatValue, floor(float))
            assertEquals(int64.doubleValue, floor(double))
            assertEquals(int64.stringValue, String(int64))
        }
    }

    func testUInt()
    {
        repeatTest
        {
            assertEquals(uInt.intValue, int)
            assertEquals(uInt.int32Value, int32)
            assertEquals(uInt.int64Value, int64)
            assertEquals(uInt.uIntValue, uInt)
            assertEquals(uInt.uInt32Value, uInt32)
            assertEquals(uInt.uInt64Value, uInt64)
            assertEquals(uInt.cgFloatValue, floor(cgFloat))
            assertEquals(uInt.floatValue, floor(float))
            assertEquals(uInt.doubleValue, floor(double))
            assertEquals(uInt.stringValue, String(uInt))
        }
    }

    func testUInt32()
    {
        repeatTest
        {
            assertEquals(uInt32.intValue, int)
            assertEquals(uInt32.int32Value, int32)
            assertEquals(uInt32.int64Value, int64)
            assertEquals(uInt32.uIntValue, uInt)
            assertEquals(uInt32.uInt32Value, uInt32)
            assertEquals(uInt32.uInt64Value, uInt64)
            assertEquals(uInt32.cgFloatValue, floor(cgFloat))
            assertEquals(uInt32.floatValue, floor(float))
            assertEquals(uInt32.doubleValue, floor(double))
            assertEquals(uInt32.stringValue, String(uInt32))
        }
    }

    func testUInt64()
    {
        repeatTest
        {
            assertEquals(uInt64.intValue, int)
            assertEquals(uInt64.int32Value, int32)
            assertEquals(uInt64.int64Value, int64)
            assertEquals(uInt64.uIntValue, uInt)
            assertEquals(uInt64.uInt32Value, uInt32)
            assertEquals(uInt64.uInt64Value, uInt64)
            assertEquals(uInt64.cgFloatValue, floor(cgFloat))
            assertEquals(uInt64.floatValue, floor(float))
            assertEquals(uInt64.doubleValue, floor(double))
            assertEquals(uInt64.stringValue, String(uInt64))
        }
    }

    func testCGFloat()
    {
        repeatTest
        {
            assertEquals(cgFloat.doubleValue, double)
            assertEquals(cgFloat.intValue, int)
            assertEquals(cgFloat.int32Value, int32)
            assertEquals(cgFloat.int64Value, int64)
            assertEquals(cgFloat.uIntValue, uInt)
            assertEquals(cgFloat.uInt32Value, uInt32)
            assertEquals(cgFloat.uInt64Value, uInt64)
            assertEquals(cgFloat.floatValue, float)
            assertEquals(cgFloat.cgFloatValue, cgFloat)
            assertEquals(cgFloat.stringValue, cgFloat.description)
        }
    }

    func testFloat()
    {
        repeatTest
        {
            assertEquals(float.doubleValue, Double(Float(double)))
            assertEquals(float.intValue, int)
            assertEquals(float.int32Value, int32)
            assertEquals(float.int64Value, int64)
            assertEquals(float.uIntValue, uInt)
            assertEquals(float.uInt32Value, uInt32)
            assertEquals(float.uInt64Value, uInt64)
            assertEquals(float.floatValue, float)
            assertEquals(float.cgFloatValue, CGFloat(Float(cgFloat)))
            assertEquals(float.stringValue, String(float))
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
