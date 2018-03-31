//
//  Dictionaries+Alchemy.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 03/31/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import Foundation
import UIKit

/*
    Contains extensions for Dictionaries (aka, Maps).
*/

//======================================
// MARK: DICTIONARY EXTENSIONS
//======================================
public extension Dictionary
{
    var size: Int { return self.count }

    var valuesArray: [Value] { return Array(self.values) }
}
