//
//  AttributedStringBuilder.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 2/16/18.
//  Copyright © 2025 Wellington Moreno. All rights reserved.
//

import Foundation

/// This class allows you to conveniently build an Attributed String,
/// one part at a time by using the Builder Pattern.
public class AttributedStringBuilder {

    private var strings: [NSAttributedString] = []

    public init() {}

    public func clear() {
        strings.removeAll()
    }

    @discardableResult
    public func add(
        string: String,
        attribute: NSAttributedString.Key,
        value: Any
    ) -> Self {
        return add(
            string: string,
            attributes: [attribute: value]
        )
    }

    @discardableResult
    public func add(
        string: String,
        attributes: [NSAttributedString.Key: Any]
    ) -> Self {
        let newString = NSAttributedString(
            string: string,
            attributes: attributes
        )
        strings.append(newString)
        return self
    }

    public func build() -> NSAttributedString {
        let result = strings.reduce(NSMutableAttributedString()) { acc, part in
            acc.append(part)
            return acc
        }

        return NSAttributedString(attributedString: result)
    }
}
