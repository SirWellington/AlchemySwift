//
//  Booleans+Alchemy.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/26/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import Foundation


public extension Bool
{
    static var random: Bool
    {
        let seed = Int.randomFrom(minInclusive: 0, maxExclusive: 101)
        return seed.isEven
    }

    mutating func toggle()
    {
        self = !self
    }

    var inverse: Bool { return !self }
    var not: Bool { return inverse }

    func inversed() -> Bool
    {
        return inverse
    }

    var asString: String { return String(self) }
}
