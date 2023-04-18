let inputs = readLine()!.split(separator: " ")
var s = inputs[0].map { String($0) }
let k = Int(inputs[1])!
var counts = [String: Int]()
var right = 0
var answer = 0

for left in 0..<s.count {

    while right < s.count && counts.keys.count <= k {
        if counts[s[right]] == nil {
            if counts.keys.count == k { break }
            
            counts[s[right]] = 1
        } else {
            counts[s[right]] = counts[s[right]]! + 1
        }

        right += 1
    }

    answer = max(answer, right - left)

    if counts[s[left]] != nil {  
        if counts[s[left]]! > 1 {
            counts[s[left]] = counts[s[left]]! - 1
        } else {
            counts[s[left]] = nil
        }
    }
}

print(answer)