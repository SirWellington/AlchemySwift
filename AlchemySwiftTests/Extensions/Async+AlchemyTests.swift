//
//  Async+AlchemyTests.swift
//  AlchemySwift
//
//  Created by Wellington Moreno on 02/16/2018.
//  Copyright © 2018 Wellington Moreno. All rights reserved.
//


import AlchemyGenerator
@testable import AlchemySwift
import AlchemyTest
import Foundation
import XCTest


//======================================
// MARK: Operation Queue Tests
//======================================
class AsyncPlusAlchemyTests: XCTestCase
{
    private var iterations = 100

    private var counter = 0
    private var queue: DispatchQueue!
    private var operationQueue: OperationQueue!

    override func setUp()
    {
        super.setUp()

        counter = 0
        queue = DispatchQueue(label: "test")
        operationQueue = OperationQueue(maxConcurrency: 1)
    }

    func testOperationQueueInitializer()
    {
        iterations.repeatBlock
        {
            let concurrency = AlchemyGenerator.integer(from: 1, to: 5)
            let queue = OperationQueue(maxConcurrency: concurrency)

            assertEquals(queue.maxConcurrentOperationCount, concurrency)
        }
    }
    
    func testSync()
    {
        let number = Int.random
        let expected = number * 2
        
        let result = operationQueue.sync { completion in
            completion(number*2)
        }
        
        assertEquals(result, expected)
    }
}



//======================================
// MARK: Dispatch Queue Tests
//======================================
extension AsyncPlusAlchemyTests
{

    func testAsyncAfterSeconds()
    {
        let secondsToWait: TimeInterval = 1

        var counter: Int = AlchemyGenerator.Integers.positive
        let expected = counter + 1

        let predicate = NSPredicate() { _, _ in
            counter == expected
        }

        expectation(for: predicate, evaluatedWith: expected, handler: nil)

        queue.asyncAfter(delay: secondsToWait)
        {
            counter += 1
        }

        waitForExpectations(timeout: secondsToWait + 2.0) { error in

            if let error = error
            {
                failTest("Operation Timed out: \(error)")
            }

        }
    }
}
