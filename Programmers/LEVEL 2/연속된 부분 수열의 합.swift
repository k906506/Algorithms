import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var result = [[Int]]()
    
    var currentSum = 0
    var left = 0
    
    for right in 0..<sequence.count {
        currentSum += sequence[right]
        
        while currentSum > k {
            currentSum -= sequence[left]
            left += 1
        }
        
        if currentSum == k {
            result.append([left, right])
        }
    }
    
    result.sort(by: { arr1, arr2 in 
        if (arr1[1] - arr1[0]) < (arr2[1] - arr2[0]) {
            return true
        } else if (arr1[1] - arr1[0]) > (arr2[1] - arr2[0]) {
            return false
        } else {
            return arr1[0] < arr2[0] ? true : false
        }
    })
    
    return result.first!
}