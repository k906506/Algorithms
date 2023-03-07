import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var deliver = 0
    var pickup = 0
    var answer: Int64 = 0
    
    for i in stride(from: n-1, through: 0, by: -1) {
        deliver += deliveries[i]
        pickup += pickups[i]
        
        // 배달이나 픽업이 하나라도 있으면 방문,
        // 음수일 경우에는 다른 지점을 방문하면서 배달, 픽업이 가능한 경우
        while deliver > 0 || pickup > 0 { 
            deliver -= cap
            pickup -= cap
            answer += Int64((i + 1) * 2)
        }
    }
    
    return answer
}