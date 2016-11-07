import Foundation

class TestClassSwift
{
    var list: [Int] = [Int](repeating: 0, count: 1000)

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
