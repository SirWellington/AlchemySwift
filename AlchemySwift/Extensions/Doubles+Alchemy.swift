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
    var millis: TimeInterval { return self / 1000}
    /** Alias for `millis` */
    var milliseconds: TimeInterval { return millis }
    var seconds: TimeInterval { return self }
    var minutes: TimeInterval { return self * 60 }
    var hours: TimeInterval { return minutes * 60 }
    var days: TimeInterval { return hours * 24 }
    var weeks: TimeInterval { return days * 7 }
}