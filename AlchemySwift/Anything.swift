//
//  Anything.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 3/20/18.
//  Copyright © 2019 Wellington Moreno. All rights reserved.
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


//======================================
// MARK: FREE FUNCTIONALITY
//======================================
/**
    Provides free functionality to objects that implement the [Anything] protocol.
*/
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

    /**
        Returns the current value if the condition supplied by
        the predicate is met, `nil` if it isn't.
    */
    func takeIf(predicate: (Self) -> Bool) -> Self?
    {
        let condition = predicate(self)
        return condition ? self : nil
    }

    var className: String
    {
        let names = String(describing: type(of: self)).components(separatedBy: ".")
        return names.last ?? "\(type(of: self.self))"
    }


    static var className: String
    {
        let names = String(describing: self).components(separatedBy: ".")
        return names.last ?? "\(type(of: self.self))"
    }
    
}


//======================================
// MARK: EXTENSIONS
//======================================
extension Int: Anything { }
extension String: Anything { }
extension Double: Anything { }
extension Float: Anything { }
extension Bool: Anything { }
extension Array: Anything { }
extension Set: Anything { }
extension Dictionary: Anything { }
extension NSObject: Anything { }
extension URL: Anything { }
extension Date: Anything { }

//============= =========================
// MARK: GLOBAL FUNCTIONS
//======================================
public func using<T: Any>(_ object: T?, _ block: (T) -> Void)
{
    if let object = object
    {
        block(object)
    }
}
