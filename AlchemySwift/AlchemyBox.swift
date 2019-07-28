//
//  AlchemyBox.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 7/28/19.
//  Copyright © 2019 Wellington Moreno. All rights reserved.
//

import Foundation

//=========================================
//MARK: STRONG BOX
//=========================================

/**
    Use as a container to hold a strong to another object.
 */
public class AlchemyStrongBox<T: Any>
{
    public var item: T
    
    public init(item: T)
    {
        self.item = item
    }
}

public extension Anything
{
    func box() -> AlchemyStrongBox<Self>
    {
        return AlchemyStrongBox(item: self)
    }
    
}

extension AlchemyStrongBox: Equatable where T: Equatable
{
    public static func ==(lhs: AlchemyStrongBox<T>, rhs: AlchemyStrongBox<T>) -> Bool
    {
        return lhs.item == rhs.item
    }
}

extension AlchemyStrongBox: Hashable where T: Hashable
{
    public func hash(into hasher: inout Hasher)
    {
        hasher.combine(self.item)
    }
}


//=========================================
//MARK: WEAK BOX
//=========================================

/**
 Use as a container to hold a weak reference to another object.
 */
public class AlchemyWeakBox<T: class>
{
    public weak var item: T?
    
    public init(item: T)
    {
        self.item = item
    }
}

public extension Anything where Self: AnyObject
{
    func weakBox() -> AlchemyWeakBox<Self>
    {
        return AlchemyWeakBox(item: self)
    }
}

extension AlchemyWeakBox: Equatable where T: Equatable
{
    public static func ==(lhs: AlchemyWeakBox<T>, rhs: AlchemyWeakBox<T>) -> Bool
    {
        return lhs.item == rhs.item
    }
}

extension AlchemyWeakBox: Hashable where T: Hashable
{
    public func hash(into hasher: inout Hasher)
    {
        if let item = self.item
        {
            hasher.combine(item)
        }
        else
        {
            hasher.combine(0)
        }
    }
}
