//
//  Doubles+Alchemy.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/26/2018.
//  Copyright © 2019 Wellington Moreno. All rights reserved.
//

import Foundation


//=====================================
//MARK: DECIMAL PRECISION
//=====================================
public extension Double
{

    /**
        Rounds this double to `places` decimal places using the specified `roundingRule`.
    */
    func rounded(toPlaces places: Int, roundingRule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Double
    {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded(roundingRule) / divisor
    }

    /**
        Truncates the decimal places of this Double to `places` decimal places.
        This operation merely removes any digits after `places`.
    */
    func truncated(toPlaces places: Int) -> Double
    {
        return self.rounded(toPlaces: places, roundingRule: .towardZero)
    }

}

//=====================================
//MARK: TIME CONVERSIONS
//=====================================

public extension TimeInterval
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
    func toMillis() -> Double
    {
        return self * 1000.0
    }

    func toSeconds() -> Double
    {
        return self
    }

    func toMinutes() -> Double
    {
        return self / 60.0
    }

    func toHours() -> Double
    {
        let minutes = self.toMinutes()
        return minutes / 60.0
    }

    func toDays() -> Double
    {
        let hours = self.toHours()
        return hours / 24.0
    }

    func toWeeks() -> Double
    {
        let days = self.toDays()
        return days / 7.0
    }

}
