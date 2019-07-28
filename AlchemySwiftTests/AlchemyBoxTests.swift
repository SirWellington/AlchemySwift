//
//  AlchemyBoxTests.swift
//  AlchemySwiftTests
//
//  Created by Wellington Moreno on 7/28/19.
//  Copyright © 2019 Wellington Moreno. All rights reserved.
//

import AlchemyGenerator
@testable
import AlchemySwift
import AlchemyTest

//=========================================
//MARK: STRONG BOX TESTS
//=========================================
class AlchemyStrongBoxTests: AlchemyTest
{
    
    override var iterations: Int { return 100 }
    
    func testWithString()
    {
        repeatTest
        {
            let string = AlchemyGenerator.alphabeticString()
            let box = AlchemyStrongBox(item: string)
            assertEquals(box.item, string)
        }
    }
    
    func testWithInteger()
    {
        repeatTest
        {
            let int = Int.random
            let box = AlchemyStrongBox(item: int)
            assertEquals(box.item, int)
        }
    }
    
    func testWithURL()
    {
        repeatTest
        {
            guard let url = AlchemyGenerator.url().asURL else { return }
            let box = url.box()
            assertEquals(box.item, url)
        }
    }
    
    func testWithDate()
    {
        repeatTest
        {
            let date = AlchemyGenerator.Dates.any
            let box = date.box()
            assertEquals(box.item, date)
        }
    }
    
    func testWithObject()
    {
        repeatTest
        {
            let object = PersonObject()
            let box = AlchemyStrongBox(item: object)
            assertEquals(box.item, object)
        }
    }
    
    func testBoxEquatable()
    {
        repeatTest
        {
            let person = PersonObject()
            let first = person.box()
            let second = AlchemyStrongBox(item: person)
            
            assertEquals(first, second)
        }
    }
    
}


//=========================================
//MARK: WEAK BOX TESTS
//=========================================
class AlchemyWeakBoxTests: AlchemyTest
{
    
    override var iterations: Int { return 100 }
    
    func testWithObject()
    {
        repeatTest
        {
            let object = PersonObject()
            let box = AlchemyWeakBox(item: object)
            assertEquals(box.item, object)
        }
    }
    
    func testBoxEquatableWhenEqual()
    {
        repeatTest
        {
            let person = PersonObject()
            let first = person.weakBox()
            let second = AlchemyWeakBox(item: person)
            
            assertEquals(first, second)
        }
    }
    
    
    func testBoxEquatableWhenNotEqual()
    {
        repeatTest
        {
            let firstPerson = PersonObject()
            let secondPerson = PersonObject()
            
            let first = firstPerson.weakBox()
            let second = secondPerson.weakBox()
            
            assertNotEquals(first, second)
        }
    }
    
    func testBoxGarbaseCollection()
    {
        repeatTest(5)
        {
            var person = PersonObject()
            let box = person.weakBox()
            assertEquals(box.item, person)
            
            person = PersonObject()
            let string = "Person is now [\(person)]"
            
            assertNil(box.item)
        }
    }
    
}


//=========================================
//MARK: CUSTOM OBJECT
//=========================================
fileprivate class PersonObject: Equatable, Anything
{
    public let id = AlchemyGenerator.uuidString()
    public let name = AlchemyGenerator.name()
    public let age = AlchemyGenerator.age()
    
    static func ==(lhs: PersonObject, rhs: PersonObject) -> Bool
    {
        guard lhs.name == rhs.name else { return false }
        guard lhs.id == rhs.id else { return false }
        guard lhs.age == rhs.age else { return false }
        
        return true
     }
}
