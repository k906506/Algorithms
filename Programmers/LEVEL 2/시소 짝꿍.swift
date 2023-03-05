import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var dict = [Float: Int]()
    
    for weight in weights {
        let floatWeight = Float(weight)
        if dict[floatWeight] == nil {
            dict[floatWeight] = 1
        } else {
            dict[floatWeight] = dict[floatWeight]! + 1
        }
    }
    
    let keys = dict.keys.sorted(by: <)
    var cnt: Int64 = 0
    
    // 경우의 수는 (1, 1), (3, 2), (4, 2), (4, 3)으로 총 네 가지
    // 오름차순으로 정렬했으므로 앞 원소에 더 큰 수를 곱해줘야 같아질 수 있음
    for left in keys {
        if dict[left]! >= 2 {
            cnt += Int64(dict[left]! * (dict[left]! - 1) / 2) // nC2의 경우의 수
        }
        
        if dict[Float(left * 3 / 2)] != nil {
            cnt += Int64(dict[left]! * dict[Float(left * 3 / 2)]!)
        }
        
        if dict[Float(left * 4 / 2)] != nil {
            cnt += Int64(dict[left]! * dict[Float(left * 4 / 2)]!)
        }
        
        if dict[Float(left * 4 / 3)] != nil {
            cnt += Int64(dict[left]! * dict[Float(left * 4 / 3)]!)
        }
    }
    
    return cnt
}