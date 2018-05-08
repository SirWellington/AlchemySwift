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
class AsyncPlusAlchemyTests: AlchemyTest
{
    private var counter = 0
    private var queue: DispatchQueue!
    private var operationQueue: OperationQueue!

    override func beforeEachTest()
    {
        counter = 0
        iterations = 100
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
        runTest(iterations: iterations)
        {
            let first = Int.random
            let second = Int.random
            let expected = first + second
            
            let result = operationQueue.sync { completion in
                completion(first + second)
            }
            
            assertEquals(result, expected)
        }
    }
    
    func testOnMain()
    {
        
        runTest
        {
            var number = 0
            let promise = expectation(description: "main thread")
            
            onMain
            {
                number = AlchemyGenerator.Integers.positive
                promise.fulfill()
            }
            
            wait(for: [promise], timeout: 10.0)
            assertThat(number > 0)
        }
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
