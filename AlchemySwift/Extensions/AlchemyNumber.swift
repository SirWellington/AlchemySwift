//
//  AlchemyNumber.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 05/17/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import Foundation


//======================================
// MARK: PROTOCOL DEFINITION
//======================================
/**
    This protocol defines the common attributes of all Swift Number types.
    It adds functionality supporting conversion to and from different number types.
*/
public protocol AlchemyNumber: Anything
{
    var asNSNumber: NSNumber { get }
    var intValue: Int { get }
    var int32Value: Int32 { get }
    var int64Value: Int64 { get }
    var uIntValue: UInt { get }
    var uInt16Value: UInt16 { get }
    var uInt32Value: UInt32 { get }
    var uInt64Value: UInt64 { get }
    var cgFloatValue: CGFloat { get }
    var floatValue: Float { get }
    var doubleValue: Double { get }
    var decimalValue: Decimal { get }
    var stringValue: String { get }
}

//======================================
// MARK: PROTOCOL EXTENSIONS
//======================================

public extension AlchemyNumber
{

    var intValue: Int { return self.asNSNumber.intValue }
    var int32Value: Int32 { return self.asNSNumber.int32Value }
    var int64Value: Int64 { return self.asNSNumber.int64Value }
    var uIntValue: UInt { return self.asNSNumber.uintValue }
    var uInt16Value: UInt16 { return self.asNSNumber.uint16Value }
    var uInt32Value: UInt32 { return self.asNSNumber.uint32Value }
    var uInt64Value: UInt64 { return self.asNSNumber.uint64Value }
    var cgFloatValue: CGFloat { return CGFloat(self.asNSNumber.doubleValue) }
    var floatValue: Float { return self.asNSNumber.floatValue }
    var doubleValue: Double { return self.asNSNumber.doubleValue }
    var decimalValue: Decimal { return self.asNSNumber.decimalValue }
    var stringValue: String { return "\(self)" }

    /**
    Converts Megabytes to bytes.
    For example, `4.mb == 4_000_000 bytes`

    - Returns truncating: the number of bytes represented by `self.mb`.
 */
    var mb: Int
    {
        return round(self.asDouble * pow(10.0, 6)).intValue
    }
}

/**
    Adds alternate names
*/
public extension AlchemyNumber
{
    var asInt: Int { return self.intValue }
    var asInt32: Int32 { return self.int32Value }
    var asInt64: Int64 { return self.int64Value }
    var asUInt: UInt { return self.uIntValue }
    var asUInt16: UInt16 { return self.uInt16Value }
    var asUInt32: UInt32 { return self.uInt32Value }
    var asUInt64: UInt64 { return self.uInt64Value }
    var asCGFloat : CGFloat { return self.cgFloatValue}
    var asFloat: Float { return self.floatValue }
    var asDouble: Double { return self.doubleValue }
    var asDecimal: Decimal { return self.decimalValue }
    var asString: String { return self.stringValue }
}

//======================================
// MARK: INTEGERS
//======================================

extension Int: AlchemyNumber
{
    public var asNSNumber: NSNumber { return self as NSNumber }
    public var intValue: Int { return self }
}

extension Int32: AlchemyNumber
{
    public var asNSNumber: NSNumber { return self as NSNumber }
    public var int32Value: Int32 { return self}
}

extension Int64: AlchemyNumber
{
    public var asNSNumber: NSNumber { return self as NSNumber }
    public var int64Value: Int64 { return self}
}

extension UInt: AlchemyNumber
{
    public var asNSNumber: NSNumber { return self as NSNumber }
    public var uIntValue: UInt { return self }
}

extension UInt16: AlchemyNumber
{
    public var asNSNumber: NSNumber { return self as NSNumber }
    public var uInt16Value: UInt16 { return self }
}

extension UInt32: AlchemyNumber
{
    public var asNSNumber: NSNumber { return self as NSNumber }
    public var uInt32Value: UInt32 { return self }
}

extension UInt64: AlchemyNumber
{
    public var asNSNumber: NSNumber { return self as NSNumber }
    public var uInt64Value: UInt64 { return self }
}


//======================================
// MARK: FLOATS
//======================================

extension Double: AlchemyNumber
{
    public var asNSNumber: NSNumber { return self as NSNumber }
    public var decimalValue: Decimal { return Decimal(self) }
    public var doubleValue: Double { return self }
}

extension Float: AlchemyNumber
{
    public var asNSNumber: NSNumber { return self as NSNumber }
    public var decimalValue: Decimal { return Decimal(Double(self)) }
    public var floatValue: Float { return self }
}

extension CGFloat: AlchemyNumber
{
    public var asNSNumber: NSNumber { return self as NSNumber }
    public var cgFloatValue: CGFloat { return self }
    public var decimalValue: Decimal { return Decimal(Double(self)) }
}

/*
    Decimal is a weird case for sure.
    It seems like internally, conversion to Integer types are flawed, and sometimes yield
    wildly inconsistent results.

    Because of this, the integer conversions have to be overridden here.
    We first convert the Decimal to a Double and then to the appropriate Int type.
*/
extension Decimal: AlchemyNumber
{
    public var asNSNumber: NSNumber { return self as NSDecimalNumber }
    public var decimalValue: Decimal { return self }
    public var stringValue: String { return (self as NSDecimalNumber).stringValue }

    public var doubleValue: Double { return Double(truncating: self.asNSNumber) }
    public var cgFloatValue: CGFloat { return CGFloat(truncating: self.asNSNumber) }

    public var intValue: Int { return Int(self.asNSNumber.doubleValue) }
    public var int32Value: Int32 { return Int32(self.asNSNumber.doubleValue) }
    public var int64Value: Int64 { return Int64(self.asNSNumber.doubleValue) }
    public var uIntValue: UInt { return UInt(self.asNSNumber.doubleValue) }
    public var uInt16Value: UInt16 { return UInt16(self.asNSNumber.doubleValue) }
    public var uInt32Value: UInt32 { return UInt32(self.asNSNumber.doubleValue) }
    public var uInt64Value: UInt64 { return UInt64(self.asNSNumber.doubleValue) }

}
