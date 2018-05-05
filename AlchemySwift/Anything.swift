//
//  Anything.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 3/20/18.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import Foundation

//======================================
// MARK: PROTOCOL DEFINITION
//======================================

/**
    This Protocol can be implemented by any object or class, and
    adds some conveniences to objects of all types.
 */
public protocol Anything
{
    
}

public extension Anything
{
    /**
        Useful with Swift's optional chaining to let you access a
        reference only if it is not nil.
     
        Example:
        ```
        var string: String? = nil
        let isEmpty = string?.with { $0.isEmpty() } ?? true
        ```
     */
    func with<T>(closure: (Self) ->(T)) -> T
    {
        return closure(self)
    }
}

//======================================
// MARK: EXTENSIONS
//======================================
extension Int: Anything { }
extension String: Anything { }
extension Double: Anything { }
extension Bool: Anything { }
extension Array: Anything { }
extension Set: Anything { }
extension Dictionary: Anything { }
extension NSObject: Anything { }
