//
//  Booleans+AlchemyTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/26/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//


import AlchemyGenerator
@testable import AlchemySwift
import AlchemyTest
import Foundation
import XCTest

class BooleansPlusAlchemyTests: XCTestCase
{

    private var bool: Bool! = nil

    override func setUp()
    {
        super.setUp()

        bool = AlchemyGenerator.positiveInteger().isEven
    }

    func testToggle()
    {
        let initial = bool
        bool.toggle()
        let after = bool

        assertNotEquals(initial, after)
    }

    func testRandomBool()
    {
        var set = Set<Bool>()

        for _ in 0...100 {
            set.insert(Bool.random)
        }

        assertThat(set.count == 2)
    }

    func testNot()
    {
        let original = bool ?? false
        let result = original.not

        assertEquals(result, !original)
    }

    func testInverse()
    {
        let original = bool ?? true
        let result = original.inverse

        assertEquals(result, !original)
    }

    func testInversed()
    {
        let original = bool ?? true
        let result = original.inversed()

        assertEquals(result, !original)
    }

    func testAsString()
    {
        let expected = "\(bool!)"
        let result = bool!.asString

        assertEquals(result, expected)
    }

}