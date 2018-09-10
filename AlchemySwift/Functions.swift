//
//  Functions.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 9/9/18.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import Foundation


public func calculatePercentage(part: Double, total: Double, decimalPlaces: Int) -> Double
{
    let percentage = (part / total) * 100.0
    return percentage.rounded(toPlaces: decimalPlaces)
}
