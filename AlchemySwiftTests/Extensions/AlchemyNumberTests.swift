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
// MARK: NUMBER TESTS
//======================================
class AlchemyNumberTests: AlchemyTest
{

    private var int: Int = 0
    private var int32: Int32 = 0
    private var int64: Int64 = 0
    private var uInt: UInt = 0
    private var uInt16: UInt16 = 0
    private var uInt32: UInt32 = 0
    private var uInt64: UInt64 = 0
    private var double: Double = 0.0
    private var float: Float = 0.0
    private var cgFloat: CGFloat = 0.0
    private var decimal: Decimal = 0.0

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
        uInt16 = UInt16(double)
        uInt32 = UInt32(double)
        uInt64 = UInt64(double)
        float = Float(double)
        cgFloat = CGFloat(double)
        decimal = Decimal(double)
    }


    //======================================
    // MARK: INTEGER TESTS
    //======================================

    func testInt()
    {
        repeatTest
        {
            assertEquals(int.intValue, int)
            assertEquals(int.int32Value, int32)
            assertEquals(int.int64Value, int64)
            assertEquals(int.uIntValue, uInt)
            assertEquals(int.uInt16Value, uInt16)
            assertEquals(int.uInt32Value, uInt32)
            assertEquals(int.uInt64Value, uInt64)
            assertEquals(int.cgFloatValue, floor(cgFloat))
            assertEquals(int.floatValue, floor(float))
            assertEquals(int.doubleValue, floor(double))
            assertEquals(int.decimalValue, Decimal(int))
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
            assertEquals(int32.uInt16Value, uInt16)
            assertEquals(int32.uInt32Value, uInt32)
            assertEquals(int32.uInt64Value, uInt64)
            assertEquals(int32.cgFloatValue, floor(cgFloat))
            assertEquals(int32.floatValue, floor(float))
            assertEquals(int32.doubleValue, floor(double))
            assertEquals(int32.decimalValue, Decimal(int))
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
            assertEquals(int64.uInt16Value, uInt16)
            assertEquals(int64.uInt32Value, uInt32)
            assertEquals(int64.uInt64Value, uInt64)
            assertEquals(int64.cgFloatValue, floor(cgFloat))
            assertEquals(int64.floatValue, floor(float))
            assertEquals(int64.doubleValue, floor(double))
            assertEquals(int64.decimalValue, Decimal(int))
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
            assertEquals(int64.uInt16Value, uInt16)
            assertEquals(uInt.uInt32Value, uInt32)
            assertEquals(uInt.uInt64Value, uInt64)
            assertEquals(uInt.cgFloatValue, floor(cgFloat))
            assertEquals(uInt.floatValue, floor(float))
            assertEquals(uInt.doubleValue, floor(double))
            assertEquals(uInt.decimalValue, Decimal(int))
            assertEquals(uInt.stringValue, String(uInt))
        }
    }

    func testUInt16()
    {
        repeatTest
        {
            assertEquals(uInt16.intValue, int)
            assertEquals(uInt16.int32Value, int32)
            assertEquals(uInt16.int64Value, int64)
            assertEquals(uInt16.uIntValue, uInt)
            assertEquals(uInt16.uInt16Value, uInt16)
            assertEquals(uInt16.uInt32Value, uInt32)
            assertEquals(uInt16.uInt64Value, uInt64)
            assertEquals(uInt16.cgFloatValue, floor(cgFloat))
            assertEquals(uInt16.floatValue, floor(float))
            assertEquals(uInt16.doubleValue, floor(double))
            assertEquals(uInt16.decimalValue, Decimal(int))
            assertEquals(uInt16.stringValue, String(uInt32))
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
            assertEquals(uInt32.uInt16Value, uInt16)
            assertEquals(uInt32.uInt32Value, uInt32)
            assertEquals(uInt32.uInt64Value, uInt64)
            assertEquals(uInt32.cgFloatValue, floor(cgFloat))
            assertEquals(uInt32.floatValue, floor(float))
            assertEquals(uInt32.doubleValue, floor(double))
            assertEquals(uInt32.decimalValue, Decimal(int))
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
            assertEquals(uInt64.uInt16Value, uInt16)
            assertEquals(uInt64.uInt32Value, uInt32)
            assertEquals(uInt64.uInt64Value, uInt64)
            assertEquals(uInt64.cgFloatValue, floor(cgFloat))
            assertEquals(uInt64.floatValue, floor(float))
            assertEquals(uInt64.doubleValue, floor(double))
            assertEquals(uInt64.decimalValue, Decimal(int))
            assertEquals(uInt64.stringValue, String(uInt64))
        }
    }


    //======================================
    // MARK: FLOAT TESTS
    //======================================

    func testCGFloat()
    {
        repeatTest
        {
            assertEquals(cgFloat.doubleValue, double)
            assertEquals(cgFloat.intValue, int)
            assertEquals(cgFloat.int32Value, int32)
            assertEquals(cgFloat.int64Value, int64)
            assertEquals(cgFloat.uIntValue, uInt)
            assertEquals(cgFloat.uInt16Value, uInt16)
            assertEquals(cgFloat.uInt32Value, uInt32)
            assertEquals(cgFloat.uInt64Value, uInt64)
            assertEquals(cgFloat.floatValue, float)
            assertEquals(cgFloat.cgFloatValue, cgFloat)
            assertEquals(cgFloat.decimalValue, decimal)
            assertEquals(cgFloat.stringValue, cgFloat.description)
        }
    }

    func testFloat()
    {
        repeatTest
        {
            assertEquals(float.intValue, int)
            assertEquals(float.int32Value, int32)
            assertEquals(float.int64Value, int64)
            assertEquals(float.uIntValue, uInt)
            assertEquals(float.uInt16Value, uInt16)
            assertEquals(float.uInt32Value, uInt32)
            assertEquals(float.uInt64Value, uInt64)
            assertEquals(float.floatValue, float)
            assertEquals(float.doubleValue, Double(Float(double)))
            assertEquals(float.cgFloatValue, CGFloat(Float(cgFloat)))
            assertEquals(float.decimalValue, Decimal(Double(float)))
            assertEquals(float.doubleValue, double, withMarginOfError: 0.0001)
            assertEquals(float.cgFloatValue, cgFloat, withMarginOfError: 0.0001)
            assertEquals(float.decimalValue, decimal, withMarginOfError: 0.0001)
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
            assertEquals(double.uInt16Value, uInt16)
            assertEquals(double.uInt32Value, uInt32)
            assertEquals(double.uInt64Value, uInt64)
            assertEquals(double.floatValue, float)
            assertEquals(double.decimalValue, Decimal(double))
            assertEquals(double.cgFloatValue, cgFloat)
            assertEquals(double.stringValue, String(double))
        }
    }

    func testDecimal()
    {
        repeatTest
        {
            assertEquals(decimal.decimalValue, decimal)
            assertEquals(decimal.intValue, int)
            assertEquals(decimal.int32Value, int32)
            assertEquals(decimal.int64Value, int64)
            assertEquals(decimal.uIntValue, uInt)
            assertEquals(decimal.uInt16Value, uInt16)
            assertEquals(decimal.uInt32Value, uInt32)
            assertEquals(decimal.uInt64Value, uInt64)
            assertEquals(decimal.floatValue, float)
            assertEquals(decimal.doubleValue, double, withMarginOfError: 0.0000001)
            assertEquals(decimal.doubleValue, double.decimalValue.doubleValue)
            assertEquals(decimal.cgFloatValue, cgFloat, withMarginOfError: 0.0000001)
            assertEquals(decimal.cgFloatValue, cgFloat.decimalValue.cgFloatValue)
            assertEquals(decimal.stringValue, decimal.asString)
        }
    }

    func testMB()
    {
        repeatTest
        {
            let megabytes = AlchemyGenerator.integer(from: 1, to: 1_000)
            let resultBytes = megabytes.mb
            
            let expected = megabytes * 1_000_000
            assertEquals(resultBytes, expected)
        }
    }


}


//======================================
// MARK: ABSOLUTE VALUE TESTS
//======================================
extension AlchemyNumberTests
{
    
    func testAbsoluteValueInt()
    {
        repeatTest
            {
                let value = Int.randomFrom(minInclusive: -1000, maxExclusive: 1000)
                if value < 0
                {
                    assertEquals(value.abs, -value)
                }
                else
                {
                    assertEquals(value.abs, value)
                }
        }
    }
    
    
    func testAbsoluteValueDouble()
    {
        repeatTest
            {
                let value = Double.random(in: -1000.0...1000.0)
                if value < 0
                {
                    assertEquals(value.abs, -value)
                }
                else
                {
                    assertEquals(value.abs, value)
                }
        }
    }
    
    
    func testAbsoluteValueFloat()
    {
        repeatTest
            {
                let value = Float.random(in: -1000.0...1000.0)
                if value < 0
                {
                    assertEquals(value.abs, -value)
                }
                else
                {
                    assertEquals(value.abs, value)
                }
        }
    }

}
