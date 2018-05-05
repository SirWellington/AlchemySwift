//
//  Async+Alchemy.swift
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
    
    /**
        Performs an operation synchronously awaits the result, blocking the calling thread
        until the operation is finished.
     
        **IMPORTANT** – You must ensure that the completion function that is passed into the `block` is called, or the
        operation will permanently block.
     */
    @discardableResult
    func sync<T>(_ block: @escaping ((T?) -> Void) -> Void) -> T?
    {
        var result: T? = nil
        let group = DispatchGroup()
        group.enter()
        
        let completion: (T?) -> Void = {
            result = $0
            group.leave()
        }
        
        addOperation {
            block(completion)
        }
        
        group.wait()
        
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
