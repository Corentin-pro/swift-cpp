//
//  test.swift
//  cpp
//
//  Created by Axopen on 12/05/2016.
//  Copyright © 2016 perso. All rights reserved.
//

import Foundation

class TestClassSwift
{
    var list: [Int] = [Int](count:1000, repeatedValue: 0)

    func hello() -> Int
    {
        return 3
    }

    func process()
    {
        var mean: Int = 0

        for i in 0...999
        {
            mean += i
            self.list[i] = i
        }

        mean /= 1000

        self.list[0] = mean
    }
}