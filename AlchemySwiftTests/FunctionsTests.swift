//
//  FunctionsTests.swift
//  AlchemySwiftTests
//
//  Created by Wellington Moreno on 9/9/18.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import AlchemyGenerator
@testable
import AlchemySwift
import AlchemyTest

//======================================
// MARK: FUNCTIONS TESTS
//======================================
class FunctionsTests: AlchemyTest
{
    
    func testCalculatePercentage()
    {
        repeatTest
        {
            let part = AlchemyGenerator.doubles(fromInclusive: 0.0, toInclusive: 1000.0)
            let total = AlchemyGenerator.doubles(fromInclusive: part + 5, toInclusive: part * 10.0)
            let decimalPlaces = Int.randomFrom(minInclusive: 1, maxExclusive: 5)
            let expected = ((part / total) * 100).rounded(toPlaces: decimalPlaces)
            let result = calculatePercentage(part: part, total: total, decimalPlaces: decimalPlaces)
            
            assertEquals(result, expected)
            
            print("\(result)%")
        }
    }
}
