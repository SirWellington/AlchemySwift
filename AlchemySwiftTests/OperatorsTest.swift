//
//  OperatorsTest.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 03/03/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import AlchemyGenerator
@testable
import AlchemySwift
import AlchemyTest


//======================================
// MARK: 
//======================================

class OperatorsTest: AlchemyTest
{
    private var first: String!
    private var second: String!
    private var list: [String]!

    override func beforeEachTest()
    {
        first = AlchemyGenerator.Strings.alphabetic
        second = AlchemyGenerator.Strings.hex
        list = AlchemyGenerator.Arrays.ofAlphabeticString
    }

    func testEitherOr()
    {
        runTest(iterations: 1000)
        {
            let possibilities: [String] = [first, second]
            let result = first ?|? second
            assertNotNil(result)
            assertThat(possibilities.contains(result!))
        }
    }

    func testEitherOrVariance()
    {
        runTest(iterations: 100)
        {
            var results = Set<String>()

            let iterations = 50

            iterations.repeatBlock
            {
                let result = first ?|? second
                assertNotNil(result)
                results.insert(result!)
            }

            assertFalse(results.isEmpty)
            assertThat(results.count == 2)
            assertThat(results.contains(first))
            assertThat(results.contains(second))
        }
    }

}