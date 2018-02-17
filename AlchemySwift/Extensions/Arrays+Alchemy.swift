//
//  Arrays+Alchemy.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 12/29/2017.
//  Copyright © 2017 Wellington Moreno. All rights reserved.
//

import Foundation


//======================================
//MARK: Accessing and Inserting Elements
//======================================

public extension Array
{
    var notEmpty: Bool { return !isEmpty }
    
    var size: Int { return count }

    var anyElement: Element?
    {
        if isEmpty
        {
            return nil
        }

        guard let index = (0..<count).anyElement, isValidIndex(index) else
        {
            return nil
        }

        return self[index]
    }

    func isValidIndex(_ index: Int) -> Bool
    {
        return index.isValidIndex(toArray: self)
    }

    subscript (safe index: Index) -> Element?
    {
        return self.isValidIndex(index) ? self[index] : nil
    }

    /**
         Adds an element to the beginning of an Array.
     */
    mutating func prepend(_ element: Element)
    {
        insert(element, at: 0)
    }
    
    mutating func add(_ element: Element)
    {
        append(element)
    }
    
    /**
         Removes the first element from the array and returns it.
         If the array is empty, or has no first element, nil is returned.

         - returns : The first element of the array, if present, `null` otherwise.
     */
    mutating func popFirst() -> Element?
    {
        guard let first = self.first else { return nil }
        self.remove(at: 0)
        
        return first
    }
}

public extension CountableRange where Element == Int
{
    var anyElement: Element?
    {
        let index = Int.randomFrom(minInclusive: self.lowerBound, maxExclusive: self.upperBound)

        return index
    }
}

//======================================
//MARK: Shuffling
//======================================
public extension Array
{

    func shuffled() -> Array<Element>
    {
        guard count >= 2
        else
        {
            return self
        }

        var mutable = Array(self)

        for (index, _) in enumerated()
        {
            let randomIndex = Int.randomFrom(minInclusive: 0, maxExclusive: count)
            mutable.swapAt(index, randomIndex)
        }

        return mutable
    }
}

//======================================
//MARK: Equality
//======================================
public extension Array where  Element: Equatable
{
    static func ==(lhs: Array<Element>, rhs: Array<Element>) -> Bool
    {
        guard lhs.notEmpty, rhs.notEmpty else { return true }
        guard lhs.count == rhs.count else { return false }

        let size = lhs.count

        for index in 0..<size
        {
            let leftValue = lhs[index]
            let rightValue = rhs[index]

            guard leftValue == rightValue else { return false }
        }

        return true
    }
}

//======================================
//MARK: Sequence Operations
//======================================
public extension Sequence where Element: Equatable
{
    func countWhere(_ predicate: (Element) -> Bool) -> Int
    {
        return filter(predicate).count
    }
}

public extension Sequence
{

    func repeatBlock(_ block: () -> ())
    {
        for _ in self
        {
            block()
        }
    }

    func onEach(_ block: (Element) -> ()) -> [Element]
    {
        return self.map
        {
            block($0)
            return $0
        }
    }
}