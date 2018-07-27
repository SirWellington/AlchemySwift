//
//  AnythingTests.swift
//  AlchemySwiftTests
//
//  Created by Wellington Moreno on 3/20/18.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import AlchemyGenerator
@testable import AlchemySwift
import AlchemyTest
import Foundation
import XCTest

//======================================
// MARK: BASE TEST
//======================================
class AnythingTests: AlchemyTest
{
    private var string = ""
    private var int = 0
    private var double = 0.0
    private var array = [String]()
    private var dictionary = [String: String]()
    
    private var returnValue = ""
    
    override func beforeEachTest()
    {
        returnValue = AlchemyGenerator.hexString()
        string = AlchemyGenerator.alphabeticString()
        int = AlchemyGenerator.positiveInteger()
        double = AlchemyGenerator.positiveDouble()
        array = AlchemyGenerator.Arrays.ofAlphanumericString
        dictionary = AlchemyGenerator.Arrays.ofAlphabeticString.reduce(into: [String: String]()) { $0[$1] = $1 }
    }
}


//======================================
// MARK: WITH TESTS
//======================================

extension AnythingTests
{
    
    func testAnythingString()
    {
        var result: String? = string.with {_ in returnValue }
        assertEquals(result, returnValue)
        
        var length = string.with { $0.length }
        assertEquals(length, string.length)
        
        var empty: String? = nil
        result = empty?.with { _ in returnValue }
        assertNil(result)
        
        length = empty?.with { $0.length } ?? 0
        assertEquals(length, 0)
    }
    
    func testAnythingInt()
    {
        var result: String? = int.with {_ in returnValue }
        assertEquals(result, returnValue)
        
        var doubled: Int? = int.with { $0 * 2 }
        assertEquals(doubled, int * 2)
        
        var empty: Int? = nil
        doubled = empty?.with { $0 * 2 }
        assertNil(doubled)
        doubled = empty?.with { $0 * 2 } ?? 0
        assertEquals(doubled, 0)
    }
    
    
    func testAnythingDouble()
    {
        var result: String? = double.with {_ in returnValue }
        assertEquals(result, returnValue)
        
        var tripled: Double? = double.with { $0 * 3 }
        assertEquals(tripled, double * 3)
        
        var empty: Double? = nil
        tripled = empty?.with { $0 * 3 }
        assertNil(tripled)
        result = empty?.with {_ in returnValue } ?? returnValue
        assertEquals(result, returnValue)
    }
    
    func testAnythingArray()
    {
        var result: String? = array.with {_ in returnValue }
        assertEquals(result, returnValue)
        
        var joined: String? = array.with { $0.joined() }
        assertEquals(joined, array.joined())
        
        var empty: [String]? = nil
        result = empty?.with { _ in returnValue }
        assertNil(result)
        joined = empty?.with { $0.joined() } ?? ""
        assertEquals(joined, "")
    }
    
    func testAnythingDictionary()
    {
        var result: String? = dictionary.with {_ in returnValue }
        assertEquals(result, returnValue)
        
        var size: Int? = dictionary.with { $0.count }
        assertEquals(size, dictionary.count)
        
        let empty: [String: String]? = nil
        result = empty?.with {_ in returnValue }
        assertNil(result)
        
        size = empty?.with { $0.count } ?? 0
        assertEquals(size, 0)
    }

    func testUsingFunction()
    {
        repeatTest
        {
            var string: String? = nil
            var count = 0

            using(string)
            {
                assertNil($0)
                count += 1
            }

            assertEquals(count, 0)

            string = AlchemyGenerator.Strings.alphabetic
            using(string)
            {
                assertEquals($0, string)
                count += 1
            }

            assertEquals(count, 1)

            using(string)
            {
                assertEquals($0, string)
            }
        }
    }

}
