//
//  AttributedStringBuilder.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 2/16/18.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import Foundation


/**
    This class allows you to conveniently build an Attributed String,
    one part at a time.
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
    
    public func add(string: String, attribute: NSAttributedStringKey, value: Any)
    {
        add(string: string, attributes: [attribute: value])
    }
    
    public func add(string: String, attributes: [NSAttributedStringKey: Any])
    {
        let newString = NSAttributedString(string: string, attributes: attributes)
        strings.add(newString)
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
