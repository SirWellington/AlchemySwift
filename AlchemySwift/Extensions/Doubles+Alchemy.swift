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
    var fromMillis: TimeInterval { return self / 1000}
    /** Alias for `millis` */
    var fromMilliseconds: TimeInterval { return fromMillis }
    var fromSeconds: TimeInterval { return self }
    var fromMinutes: TimeInterval { return self * 60 }
    var fromHours: TimeInterval { return fromMinutes * 60 }
    var fromDays: TimeInterval { return fromHours * 24 }
    var fromWeeks: TimeInterval { return fromDays * 7 }
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
