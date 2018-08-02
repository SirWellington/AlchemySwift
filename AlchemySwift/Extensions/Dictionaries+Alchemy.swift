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
// MARK: DICTIONARY EXTENSIONS - COMPUTED VARIABLES
//======================================
public extension Dictionary
{
    ///Alias for `count`
    var size: Int { return self.count }

    ///Returns an Array containing all of the dictionary's keys.
    var keysArray: [Key] { return Array(self.keys) }
    
    ///Returns an Array containing all of the dictionary's values
    var valuesArray: [Value] { return Array(self.values) }

    // Returns `true` if this dictionary has entries, `false` if it is empty.
    var notEmpty: Bool { return !isEmpty }
}

public extension NSDictionary
{
    /// Alias for `count`
    var size: Int { return self.count }

    /// Returns `true` if this dictionary has no entries, `false` if it has entries
    var isEmpty: Bool { return self.size == 0}

    /// Returns `true` if this dictionary has entries, `false` if it is empty
    var notEmpty: Bool { return self.size > 0 }

}