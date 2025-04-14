//
//  Operators.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 03/03/2018.
//  Copyright © 2025 Wellington Moreno. All rights reserved.
//

import Foundation

//======================================
// MARK: EITHER OR OPERATOR
//======================================

infix operator ?|?: AdditionPrecedence

/// *Either-Or* operator. This function returns either the value on the left
/// or the value on the right.
///
/// This is useful when you want to randomize some part of your code.
/// Use this function when you don't care which one of the two gets selected.
///
/// - Returns: Either the value on the left, or the value on the right, chosen at random.
public func ?|? <T: Any>(lhs: T, rhs: T) -> T {
    let seed = Int.random
    return seed.isEven ? lhs : rhs
}
