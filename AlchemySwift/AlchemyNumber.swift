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
    var uInt32Value: UInt32 { get }
    var uInt64Value: UInt64 { get }
    var cgFloatValue: CGFloat { get }
    var floatValue: Float { get }
    var doubleValue: Double { get }
    var stringValue: String { get }
}

//======================================
// MARK: PROTOCOL EXTENSIONS
//======================================

public extension AlchemyNumber
{
    var intValue: Int { return Int(truncating: self.asNSNumber) }
    var int32Value: Int32 { return Int32(truncating: self.asNSNumber) }
    var int64Value: Int64 { return Int64(truncating: self.asNSNumber) }
    var uIntValue: UInt { return UInt(truncating: self.asNSNumber) }
    var uInt32Value: UInt32 { return UInt32(truncating: self.asNSNumber) }
    var uInt64Value: UInt64 { return UInt64(truncating: self.asNSNumber) }
    var cgFloatValue: CGFloat { return CGFloat(self.asNSNumber) }
    var floatValue: Float { return Float(truncating: self.asNSNumber) }
    var doubleValue: Double { return Double(truncating: self.asNSNumber) }
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
    var asUInt32: UInt32 { return self.uInt32Value }
    var asUInt64: UInt64 { return self.uInt64Value }
    var asCGFloat : CGFloat { return self.cgFloatValue}
    var asFloat: Float { return self.floatValue }
    var asDouble: Double { return self.doubleValue }
    var asString: String { return self.stringValue }
}

//======================================
// MARK: IMPLEMENTATIONS
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

extension Double: AlchemyNumber
{
    public var asNSNumber: NSNumber { return self as NSNumber }
    public var doubleValue: Double { return self }
}

extension Float: AlchemyNumber
{
    public var asNSNumber: NSNumber { return self as NSNumber }
    public var floatValue: Float { return self }
}

extension CGFloat: AlchemyNumber
{
    public var asNSNumber: NSNumber { return self as NSNumber }
    public var cgFloatValue: CGFloat { return self }
}
