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
// MARK: TESTS
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
    
    
}
