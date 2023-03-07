import Foundation

let discounts = [40, 30, 20, 10]
var discountRatios = [[Int]]()

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    calculateAllDiscountRatio(emoticons) // 모든 경우의 수 계산
    
    var discountEmoticons = emoticons
    var emoticonPlus = 0
    var totalPrice = 0
    
    for discount in discountRatios { // discount에는 할인율이 들어있음
        var cnt = 0 // 이모티콘 플러스 가입자
        var price = 0 // 이모티콘 판매액
        
        for user in users {
            var sum = 0
            
            for i in 0..<discount.count {
                if discount[i] >= user[0] {
                    sum += emoticons[i] * (100 - discount[i]) / 100
                }
            }
            
            if sum >= user[1] {
                cnt += 1 // 이모티콘 플러스 가입
            } else {
                price += sum // 이므티콘 판매액 증가
            }
        }
        
        if emoticonPlus < cnt {
            emoticonPlus = cnt 
            totalPrice = price
        } else if emoticonPlus == cnt, totalPrice < price {
            totalPrice = price
        }
    }
    
    return [emoticonPlus, totalPrice]
}

func calculateAllDiscountRatio(_ emoticons: [Int]) {
    var array = [Int](repeating: 0, count: emoticons.count)

    dfs(0, array)
}

func dfs(_ index: Int, _ array: [Int]) {
    var temp = array // copy
    
    if index == temp.count {
        discountRatios.append(temp)
        return
    }
    
    for i in 0..<4 {
        if temp[index] == 0 {
            temp[index] = discounts[i]
            dfs(index + 1, temp)
            temp[index] = 0
        }
    }
}