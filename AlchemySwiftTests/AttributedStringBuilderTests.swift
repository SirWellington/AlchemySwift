//
//  AttributedStringBuilderTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 02/17/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import AlchemyGenerator
@testable import AlchemySwift
import AlchemyTest
import Foundation
import XCTest


//======================================
// MARK: TEST
//======================================

class AttributedStringBuilderTests: XCTestCase
{
    private var iterations = 100
    private var anyStrings: [String] { return AlchemyGenerator.Arrays.ofString }

    private var builder = AttributedStringBuilder()

    override func setUp()
    {
        super.setUp()
    }

    func testWithNothing()
    {
        repeatTest
        {
            let result = builder.build()
            assertEquals(result, "".asAttributed)
        }
    }
    
    func testAddMultiple()
    {
        repeatTest
        {
            let strings = self.anyStrings
            builder.clear()
            
            strings.forEach { builder.add(string: $0, attributes: [:]) }
            
            let result = builder.build()
            
            let expected = strings.reduce(NSMutableAttributedString()) { it, string in
                it.append(string.asAttributed)
                return it
            }
        
            assertEquals(result, expected)
        }
    }
    
    func testAddMultipleWithAttributes()
    {
        repeatTest
        {
            let strings = self.anyStrings
            let strokeWidth = AlchemyGenerator.doubles(fromInclusive: 0.0, toInclusive: 10.0)
            let attributes: [NSAttributedStringKey: Any] = [
                NSAttributedStringKey.strokeWidth : CGFloat(strokeWidth)
            ]
            
            builder.clear()
            
            strings.forEach { builder.add(string: $0, attributes: attributes) }
            
            let expected = strings.reduce(NSMutableAttributedString()) { it, string in
                let toAdd = NSAttributedString(string: string, attributes: attributes)
                it.append(toAdd)
                return it
            }
            
            let result = builder.build()
            
            assertEquals(result, expected)
        }
    }
}
