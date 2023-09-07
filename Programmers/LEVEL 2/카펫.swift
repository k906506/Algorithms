import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var answer = [Int]()
    let halfBrown = brown / 2
    
    for height in 1...(halfBrown / 2) {
        let width = halfBrown - height
        
        if (width - 2) * height == yellow {
            answer = [width, height + 2]
            break
        }
    }
    
    return answer
}