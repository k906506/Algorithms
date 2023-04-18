let words = readLine()!.map { String($0) }
var alphabets = [Int](repeating: 0, count: 26) // 알파벳의 횟수를 카운팅하기 위한 배열
var right = 0
var rightIndex = 0
var answer = 0

for left in 0..<words.count {
    rightIndex = Int(UnicodeScalar(words[left])!.value) - 97

    while right < words.count {
        rightIndex = Int(UnicodeScalar(words[right])!.value) - 97

        if alphabets[rightIndex] == 0 {
            alphabets[rightIndex] += 1
            right += 1
        } else {
            break
        }
    }

    answer = max(answer, right - left)

    let leftIndex = Int(UnicodeScalar(words[left])!.value) - 97
    alphabets[leftIndex] -= 1
}

print(answer)