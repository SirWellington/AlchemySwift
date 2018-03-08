//
//  Doubles+Alchemy.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/26/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import Foundation


//=====================================
//MARK: Conversions
//=====================================
public extension Double
{
    var asInt: Int { return Int(self) }
    var intValue: Int { return asInt }
    var asString: String { return String(self) }

}


//=====================================
//MARK: Time Conversions
//=====================================

public extension Double
{
    static func from(millis: Double) -> TimeInterval
    {
        return millis / 1000.0
    }

    static func from(seconds: Double) -> TimeInterval
    {
        return seconds
    }

    static func from(minutes: Double) -> TimeInterval
    {
        return minutes * 60
    }

    static func from(hours: Double) -> TimeInterval
    {
        let minutes = hours * 60
        return from(minutes: minutes)
    }

    static func from(days: Double) -> TimeInterval
    {
        let hours = days * 24
        return from(hours: hours)
    }

    static func from(weeks: Double) -> TimeInterval
    {
        let days = weeks * 7
        return from(days: days)
    }
}

public extension TimeInterval
{
    var toMillis: Double { return self * 1000.0 }
    var toSeconds: Double { return self }
    var toMinutes: Double { return self / 60.0 }
    var toHours: Double { return self.toMinutes / 60.0 }
    var toDays: Double { return self.toHours / 24.0 }
    var toWeeks: Double { return self.toDays / 7.0 }
}
