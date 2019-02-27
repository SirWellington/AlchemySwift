//
//  Async+Alchemy.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 02/16/2018.
//  Copyright © 2019 Wellington Moreno. All rights reserved.
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
    
    /**
        Performs an operation synchronously awaits the result, blocking the calling thread
        until the operation is finished.
     */
    @discardableResult
    func sync<T>(_ block: @escaping () -> T?) -> T?
    {
        var result: T? = nil
        let group = DispatchGroup()
        group.enter()
        
        addOperation {
            result = block()
            group.leave()
        }
        
        return result
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
    func asyncAfter(delay: TimeInterval, block: @escaping Block)
    {
        let millis = delay.toMillis()
        let delay: DispatchTime = DispatchTime.now() + DispatchTimeInterval.milliseconds(millis.intValue)
        asyncAfter(deadline: delay, execute: block)
    }
}
