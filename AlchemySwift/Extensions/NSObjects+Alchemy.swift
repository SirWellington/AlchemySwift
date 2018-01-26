//
//  NSObjects+Alchemy.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 01/26/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import Foundation

public extension NSObjectProtocol
{
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