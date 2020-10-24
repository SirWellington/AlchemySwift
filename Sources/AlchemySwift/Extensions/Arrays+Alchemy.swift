//
//  Arrays+Alchemy.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 12/29/2017.
//  Copyright © 2019 Wellington Moreno. All rights reserved.
//

import Foundation


//======================================
//MARK: ACCESSING AND INSERTING ELEMENTS
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
    @discardableResult
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
// MARK: REMOVING ELEMENTS
//======================================
public extension Array where Element: Equatable
{
    mutating func removeElements(_ elements: [Element])
    {
        elements.compactMap { self.firstIndex(of: $0) }
                .reversed()
                .forEach { self.remove(at: $0) }
    }
}

public extension Array
{
    mutating func removeWhere(_ predicate: (Element) -> (Bool))
    {
        self.enumerated()
            .compactMap { predicate($1) ? $0 : nil }
            .reversed()
            .forEach { self.remove(at: $0) }
    }
}


//======================================
//MARK: SHUFFLING
//======================================
public extension Array
{

    func shuffled() -> Array<Element>
    {
        guard count >= 2 else
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
//MARK: CIRCULATION
//======================================
public extension Array
{

    mutating func circulateNext() -> Element
    {
        let head = removeFirst()
        append(head)
        return head
    }

    mutating func circulatePrevious() -> Element
    {
        let tail = removeLast()
        prepend(tail)
        return tail
    }

    mutating func circulateNextSafe() -> Element?
    {
        guard !isEmpty
        else
        {
            return nil
        }

        return circulateNext()
    }

    mutating func circulatePreviousSafe() -> Element?
    {
        guard !isEmpty
        else
        {
            return nil
        }

        return circulatePrevious()
    }

}


//======================================
//MARK: SEQUENCE OPERATIONS
//======================================
public extension Sequence where Element: Equatable
{
    /**
     This is a simple reverse condition to the `contains(Element)` function
     
     For Example:
     ``` if array.doesNotContain("this") { thenDoThat() } ```
     */
    func doesNotContain(_ element: Element) -> Bool
    {
        return !contains(element)
    }
    
    /**
     Counts all of the elements that pass the `predicate`
     
     - Parameter predicate: Determines whether to count the element or not
     
     - Returns: The number of elements that match the predicate
     */
    func countWhere(_ predicate: (Element) -> Bool) -> Int
    {
        return filter(predicate).count
    }
    
    /**
     Returns a sequence with all of the unique elements
     of the `Sequence`.
     
     Unlike `distinct()` this operation keeps the original order
     of elements in the array.
     
     - Performance: `O(n²)`
     
    */
    func unique() -> [Element]
    {
        return unique { $0 }
    }
    
    /**
     Returns a sequence with all of the unique elements, determined by the `on` function.
     
     ```
     struct User
     {
        var userId: String
        var name: String
        var age: Int
     }
     
     let users = [User]() //Populated by some call
     
     let uniqueUsers = users.unique(on: { $0.userId } )
     
     ```
     
     - Performance: `O(n²)`
    */
    func unique<T: Equatable>(on: (Element) -> T) -> [Element]
    {
        var results = [T]()
        
        return self.filter
        {
            let property = on($0)
            if results.contains(property)
            {
                return false
            }
            else
            {
                results.add(property)
                return true
            }
        }
    }
}

public extension Sequence where Element: Hashable
{
    /**
     Just like `unique()`, this function returns all
     of the unique elements of this sequence.
     
     Unlike `distinct()`, this function does not keep the order
     of elements in the original sequence. This operation is also more performant, running in `O(n)` time, instead of `O(n²)`
    */
    func distinct() -> [Element]
    {
        var seen = [Element: Bool]()
        
        return self.filter
        {
            if let _ = seen[$0]
            {
                return false
            }
            else
            {
                seen[$0] = true
                return true
            }
        }
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

    @discardableResult
    func onEach(_ block: (Element) -> ()) -> [Element]
    {
        return self.map
        {
            block($0)
            return $0
        }
    }
}


//======================================
// MARK: CONVENIENCE ARRAY SLICE FUNCTION
//======================================
public extension ArraySlice
{
    func toArray() -> [Element]
    {
        return Array(self)
    }
}



//======================================
// MARK: EQUATABLE EXTENSIONS
//======================================
public extension Equatable
{

    func isIn(_ list: [Self]) -> Bool
    {
        return list.contains(self)
    }

    func isNotIn(_ list: [Self]) -> Bool
    {
        return !isIn(list)
    }

}
