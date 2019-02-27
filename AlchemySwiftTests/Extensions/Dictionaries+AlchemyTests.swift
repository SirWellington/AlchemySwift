//
//  Dictionaries+AlchemyTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 03/31/2018.
//  Copyright © 2019 Wellington Moreno. All rights reserved.
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
    var dictionary: [String: Int] = [:]
    var newString: String { return AlchemyGenerator.Strings.alphanumeric }
    var newInt: Int { return AlchemyGenerator.Integers.any }

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

    func testNotEmpty()
    {
        repeatTest
        {
            let dictionaryWithData = self.dictionary
            assertTrue(dictionaryWithData.notEmpty)

            let emptyDict = [String: String]()
            assertFalse(emptyDict.notEmpty)
        }
    }
}



//======================================
// MARK: NSDICTIONARY TESTS
//======================================
class NDictionaryPlusTests: DictionariesPlusAlchemyTests
{
    private var nsDictionary: NSDictionary { return self.dictionary as! NSDictionary }

    override func testSize()
    {
        repeatTest
        {
            assertEquals(nsDictionary.size, nsDictionary.count)
        }
    }

    func testIsEmpty()
    {
        let emptyDictionary = NSDictionary()

        repeatTest
        {
            assertFalse(nsDictionary.isEmpty)
            assertTrue(emptyDictionary.isEmpty)
        }
    }

    override func testNotEmpty()
    {
        let emptyDictionary = NSDictionary()

        repeatTest
        {
            assertFalse(emptyDictionary.notEmpty)
            assertTrue(nsDictionary.notEmpty)
        }
    }

}
