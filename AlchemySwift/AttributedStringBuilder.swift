//
//  AttributedStringBuilder.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 2/16/18.
//  Copyright © 2019 Wellington Moreno. All rights reserved.
//

import Foundation


/**
    This class allows you to conveniently build an Attributed String,
    one part at a time by using the Builder Pattern.
 */
public class AttributedStringBuilder
{
    private var strings: [NSAttributedString] = []
    
    public init()
    {
        
    }
    
    public func clear()
    {
        strings.removeAll()
    }
    
    @discardableResult
    public func add(string: String, attribute: NSAttributedStringKey, value: Any) -> Self
    {
        return add(string: string, attributes: [attribute: value])
    }
    
    @discardableResult
    public func add(string: String, attributes: [NSAttributedStringKey: Any]) -> Self
    {
        let newString = NSAttributedString(string: string, attributes: attributes)
        strings.add(newString)

        return self
    }
    
    public func build() -> NSAttributedString
    {
        let result = strings.reduce(NSMutableAttributedString()) { it, part in
            it.append(part)
            return it
        }
        
        return NSAttributedString(attributedString: result)
    }
}
