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
     
        **IMPORTANT** – You must ensure that the completion function that is passed into the `block` is called, or the
        operation will permanently block.
     */
    @discardableResult
    func sync<T>(_ block: @escaping (@escaping (T?) -> Void) -> Void) -> T?
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

/**
    This global convenience function allows you to quickly submit a
    block of code for execution on the main thread. This function call returns
    immediately.
 
    - parameter block: The block to execute on the main thread
 */
public func onMain(_ block: @escaping () -> Void)
{
    OperationQueue.main.addOperation(block)
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


//======================================
// MARK: Anything Extensions
//======================================
public extension Anything where Self: AnyObject
{
    
    /**
     Add an operation to be executed on the specified Dispatch Queue.
     
     - parameter delay: How long of a delay before running the operation. By default, there is no delay.
     - parameter queue: The Dispatch Queue where the block will be posted to. Defaults to `main`.
     - parameter block: The operation to run on the main thread.
     */
    func post(delay: TimeInterval = 0, queue: DispatchQueue = .main, _ block: @escaping (Self) -> ())
    {
        let blockWrapper =
        { [weak self] in
            if let self = self
            {
                block(self)
            }
        }
        
        if delay > 0
        {
            queue.asyncAfter(delay: delay, block: blockWrapper)
        }
        else
        {
            queue.async(execute: blockWrapper)
        }
    }
    
}

