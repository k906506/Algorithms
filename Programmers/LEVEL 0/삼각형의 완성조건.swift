import Foundation

func solution(_ sides:[Int]) -> Int {
    var nums: [Int] = sides
    nums.sort()
    return nums[2] < nums[1] + nums[0] ? 1 : 2
}
