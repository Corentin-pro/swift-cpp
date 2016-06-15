//
//  ViewController.swift
//  cpp
//
//  Created by Axopen on 11/05/2016.
//  Copyright © 2016 perso. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // UI reference
    @IBOutlet var swiftInstantiatingLabel: UILabel!
    @IBOutlet var cppInstantiatingLabel: UILabel!
    @IBOutlet var swiftProcessingLabel: UILabel!
    @IBOutlet var cppProcessingLabel: UILabel!

    var testTimes = [NSTimeInterval]()

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.swiftInstantiatingLabel.text = nil
        self.cppInstantiatingLabel.text = nil
        self.swiftProcessingLabel.text = nil
        self.cppProcessingLabel.text = nil
    }


    @IBAction func startTests()
    {
        self.testTimes.removeAll()

        self.testInstantiatingSwift()
        self.showResult(self.swiftInstantiatingLabel)

        self.testInstantiatingCPP()
        self.showResult(self.cppInstantiatingLabel)

        self.testProcessingSwift()
        self.showResult(self.swiftProcessingLabel)

        self.testProcessingCPP()
        self.showResult(self.cppProcessingLabel)
    }

    func testInstantiatingCPP()
    {
        for _ in 0...100
        {
            let startTime = NSDate().timeIntervalSince1970

            var usingTest: Int32 = 0
            for j: Int32 in 0...10_000
            {
                let test = TestClassCpp()
                usingTest += j - test.hello()
            }

            testTimes.append( NSDate().timeIntervalSince1970 - startTime )
        }
    }

    func testInstantiatingSwift()
    {
        for _ in 0...100
        {
            let startTime = NSDate().timeIntervalSince1970

            var usingTest: Int32 = 0
            for j: Int32 in 0...10_000
            {
                let test = TestClassSwift()
                usingTest += j - test.hello()
            }

            testTimes.append( NSDate().timeIntervalSince1970 - startTime )
        }
    }

    func testProcessingCPP()
    {
        for _ in 0...100
        {
            let startTime = NSDate().timeIntervalSince1970

            let test = TestClassCpp()
            for _ in 0...1000
            {
                test.process()
            }

            testTimes.append( NSDate().timeIntervalSince1970 - startTime )
        }
    }

    func testProcessingSwift()
    {
        for _ in 0...100
        {
            let startTime = NSDate().timeIntervalSince1970

            let test = TestClassSwift()
            for _ in 0...1000
            {
                test.process()
            }

            testTimes.append( NSDate().timeIntervalSince1970 - startTime )
        }
    }

    func showResult(p_label: UILabel)
    {
        var minTime: NSTimeInterval = self.testTimes.first ?? 0
        var maxTime: NSTimeInterval = self.testTimes.first ?? 0
        var meanTime: Double = 0

        for time in self.testTimes
        {
            if minTime > time
            {
                minTime = time
            }
            if maxTime < time
            {
                maxTime = time
            }
            meanTime = meanTime + time
        }
        if 0 < self.testTimes.count
        {
            meanTime /= Double(self.testTimes.count)
        }

        self.testTimes.removeAll()

        p_label.text = "minTime : \(round(minTime * 1000_000)) \u{03BC}s\nmaxTime : \(round(maxTime * 1000_000)) \u{03BC}s\nmeanTime : \(round(meanTime * 1000_000)) \u{03BC}s"
    }
}

