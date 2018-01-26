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
