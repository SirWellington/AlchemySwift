//
//  Dictionaries+AlchemyTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 03/31/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import AlchemyGenerator
@testable import AlchemySwift
import AlchemyTest
import Foundation
import UIKit


//======================================
// MARK: DICTIONARY TESTS
//======================================
class DictionariesPlusAlchemyTests: AlchemyTest
{
    private var dictionary: [String: Int] = [:]
    private var newString: String { return AlchemyGenerator.Strings.alphanumeric }
    private var newInt: Int { return AlchemyGenerator.Integers.any }

    override func beforeEachTest()
    {
        let size = AlchemyGenerator.integer(from: 10, to: 50)

        (0..<size).forEach
        { _ in
            let key = self.newString
            let value = self.newInt
            dictionary[key] = value 
        }

    }

    override func afterEachTest()
    {
        dictionary.removeAll()
    }

    func testSize()
    {
        var empty = [String: Int]()
        assertEquals(empty.size, 0)

        repeatTest
        {
            assertEquals(dictionary.size, dictionary.count)
        }
    }
    
    func testKeysArray()
    {
        repeatTest
        {
            let expected = Array(dictionary.keys)
            let result = dictionary.keysArray
            assertEquals(result, expected)
        }
    }

    func testValuesArray()
    {
        repeatTest
        {
            let expected = Array(dictionary.values)
            let result = dictionary.valuesArray

            assertEquals(result, expected)
        }
    }
}
