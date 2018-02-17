//
//  Async+.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 02/16/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//

import Foundation


//======================================
// MARK: Operation Queues
//======================================
public extension OperationQueue
{
    convenience init(maxConcurrency: Int)
    {
        self.init()
        maxConcurrentOperationCount = maxConcurrency
    }
}


//======================================
// MARK: Dispatch Queues
//======================================

public extension DispatchQueue
{
    typealias Block = () -> ()

    /**
         - parameter seconds: The number of seconds to wait until executing the given block.
     */
    func asyncAfter(seconds: TimeInterval, block: @escaping Block)
    {
        let millis = seconds.millis.intValue
        let delay: DispatchTime = DispatchTime.now() + DispatchTimeInterval.milliseconds(millis)
        asyncAfter(deadline: delay, execute: block)
    }
}
