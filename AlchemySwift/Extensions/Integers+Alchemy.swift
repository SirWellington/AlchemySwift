//
//  Integers+Alchemy.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 12/29/2017.
//  Copyright © 2017 Wellington Moreno. All rights reserved.
//

import Foundation

//=====================================
//MARK: Basics
//=====================================
public extension Int
{

    func isValidIndex<T>(toArray array: Array<T>) -> Bool
    {

        if self < 0
        {
            return false
        }

        return self < array.count
    }

    static func randomFrom(minInclusive: Int, maxExclusive: Int) -> Int
    {

        guard maxExclusive > minInclusive
        else
        {
            return maxExclusive
        }

        let distance = maxExclusive - minInclusive

        let randomValue = Int(arc4random_uniform(UInt32(distance)))
        let result = randomValue + minInclusive

        return result
    }

    var isEven: Bool
    {
        return self % 2 == 0
    }

    var isOdd: Bool
    {
        return !isEven
    }

    static var random: Int
    {
        return randomFrom(minInclusive: 0, maxExclusive: 10_000)
    }

    func repeatBlock(_ block: () -> ())
    {
        guard self > 0 else { return }

        (1...self).repeatBlock(block)
    }
}


//=====================================
//MARK: Conversions
//=====================================

public extension Int
{
    var asDouble: Double { return Double(self) }
    var doubleValue: Double { return asDouble }

    var asUInt: UInt { return UInt(self) }
    var asUInt32: UInt32 { return UInt32(self) }
    var uInt32: UInt32 { return UInt32(self) }

    var asString: String { return String(self) }

    /**
        Converts Megabytes to bytes.
        For example, `4.mb == 4_000_000 bytes`

        - Returns the number of bytes represented by `self.mb`.
    */
    var mb: Int { return round(self.asDouble * pow(1.0, 6)).intValue }

}

public extension UInt32
{

    var intValue: Int
    {
        return Int(self)
    }
}


//=====================================
//MARK: Time Conversions
//=====================================

public extension Int
{
    var millis: TimeInterval { return self.asDouble.millis }
    var seconds: TimeInterval { return self.asDouble.seconds}
    var minutes: TimeInterval { return self.asDouble.minutes }
    var hours: TimeInterval { return self.asDouble.hours }
    var days: TimeInterval { return self.asDouble.days }
    var weeks: TimeInterval { return self.asDouble.weeks }
}