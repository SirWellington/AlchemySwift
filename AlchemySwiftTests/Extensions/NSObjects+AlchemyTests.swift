//
//  NSObjects+AlchemyTests.swift
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


class NSObjectsPlusAlchemyTests: AlchemyTest
{

    func testClassNameVariable()
    {
        let className = NSObjectsPlusAlchemyTests.className

        testClassName(className)
    }

    func testClassNameOnInstance()
    {
        let instance = self
        let className = instance.className

        testClassName(className)
    }

    private func testClassName(_ className: String)
    {
        assertThat(className != nil)
        assertFalse(className.isEmpty)

        let expected = "NSObjectsPlusAlchemyTests"
        assertEquals(className, expected)
    }

}