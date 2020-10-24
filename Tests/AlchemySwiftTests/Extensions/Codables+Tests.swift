//
//  Codables+Tests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 07/27/2018.
//  Copyright © 2019 Wellington Moreno. All rights reserved.
//

import AlchemyGenerator
@testable import AlchemySwift
import AlchemyTest
import Foundation


//======================================
// MARK: CODABLE EXTENSION TESTS
//======================================

fileprivate let serializer = JSONEncoder()
fileprivate let deserializer = JSONDecoder()

class BaseCodableTest: AlchemyTest
{
    var boolean: Bool = false
    var int: Int = 0
    var double: Double = 0
    var string: String = ""
    var array: [String] = []
    var dictionary: [String: String] = [:]

    override func beforeEachTest()
    {
        boolean = AlchemyGenerator.Booleans.any
        int = AlchemyGenerator.Integers.any
        double = AlchemyGenerator.Doubles.any
        string = AlchemyGenerator.Strings.alphabetic
        array = AlchemyGenerator.Arrays.ofString
        dictionary = createDictionary()
    }

    private func createDictionary(size: Int = 10) -> [String: String]
    {
        var dictionary = [String: String]()

        size.repeatBlock
        {
            let key = AlchemyGenerator.Strings.hex
            let value = AlchemyGenerator.Strings.alphanumeric
            dictionary[key] = value
        }

        return dictionary
    }
}


//======================================
// MARK: ENCODABLE TESTS
//======================================

class AnyEncodableTests: BaseCodableTest
{

    func testWithBoolean()
    {
        repeatTest
        {
            testEncodable(encodable: boolean)
        }
    }

    func testWithDouble()
    {
        repeatTest
        {
            testEncodable(encodable: double)
        }
    }

    func testWithInt()
    {
        repeatTest
        {
            testEncodable(encodable: int)
        }
    }

    func testWithString()
    {
        repeatTest
        {
            testEncodable(encodable: string)
        }
    }

    func testWithArray()
    {
        repeatTest
        {
            testEncodable(encodable: array)
        }
    }

    func testWithDictionary()
    {
        repeatTest
        {
            testEncodable(encodable: dictionary)
        }
    }

    private func testEncodable<T: Encodable>(encodable: T)
    {
        let object = EncodableObject(AnyEncodable(encodable))
        let serialized = try? serializer.encode(object)
        assertNotNil(serialized)
    }

    class EncodableObject: Encodable
    {
        var encodable: AnyEncodable

        init(_ encodable: AnyEncodable)
        {
            self.encodable = encodable
        }
    }

}


//======================================
// MARK: CODABLE TESTS
//======================================
class AnyCodableTests: BaseCodableTest
{
    func testWithBoolean()
    {
        repeatTest
        {
            testCodable(codable: boolean)
        }
    }

    func testWithDouble()
    {
        repeatTest
        {
            testCodable(codable: double)
        }
    }

    func testWithInt()
    {
        repeatTest
        {
            testCodable(codable: int)
        }
    }

    func testWithString()
    {
        repeatTest
        {
            testCodable(codable: string)
        }
    }

    func testWithArray()
    {
        repeatTest
        {
            testCodable(codable: array)
        }
    }

    func testWithDictionary()
    {
        repeatTest
        {
            testCodable(codable: dictionary)
        }
    }

    private func testCodable<T: Codable>(codable: T)
    {
        let object = CodableObject(AnyCodable(codable))

        let serialized = try? serializer.encode(object)
        assertNotNil(serialized)

        let deserialized = try? deserializer.decode(CodableObject.self, from: serialized!)
        assertNotNil(deserialized)

        guard let result = deserialized?.codable else { return }

        assertEquals(result, AnyCodable(codable))

    }

    class CodableObject: Codable
    {
        var codable: AnyCodable

        init(_ codable: AnyCodable)
        {
            self.codable = codable
        }


    }

}
