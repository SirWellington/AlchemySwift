//
//  Dates+Alchemy.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 02/07/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import Foundation


//======================================
// MARK: Convenience Functions
//======================================
public extension Date
{
    var isInThePast: Bool
    {
        let now = Date()
        return self.timeIntervalSince1970 < now.timeIntervalSince1970
    }
    
    var isInTheFuture: Bool
    {
        let now = Date()
        return self.timeIntervalSince1970 > now.timeIntervalSince1970
    }
    
    /**
        Returns a new date that is `timeInterval` seconds before this date.
    */
    func subtractingTimeInterval(_ timeInterval: TimeInterval) -> Date
    {
        return self.addingTimeInterval(-timeInterval)
    }
}

//======================================
// MARK: Formatting Dates
//======================================
public extension Date
{

    /**
        Formats this Date into the given test format.

        For rules on formatting Dates, I highly recommend [this](http://nsdateformatter.com).

        - returns: This date formatted in `dateFormat`.
    */
    func formatTo(dateFormat: String, timeZone: TimeZone = .autoupdatingCurrent) -> String
    {
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.dateFormat = dateFormat

        return formatter.string(from: self)
    }
}
