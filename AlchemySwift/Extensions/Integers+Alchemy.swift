//
//  Integers+Alchemy.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 12/29/2017.
//  Copyright © 2017 Wellington Moreno. All rights reserved.
//

import Foundation

//=====================================
//MARK: BASICS
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

