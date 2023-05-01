let n = Int(readLine()!)!
var infos = [[Int]]()

for _ in 0..<n {
    infos.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

infos.sort(by: { $0[1] > $1[1] }) // y에 대해 내림차순으로 정렬

var left = 0
var right = n - 1
var answer = 0

while left < right {
    answer = max(answer, infos[left][1] + infos[right][1])

    if infos[left][0] > infos[right][0] { 
        infos[left][0] -= infos[right][0]

        right -= 1 // 모두 소모했으니 앞으로 한 칸 이동
    } else if infos[left][0] < infos[right][0] {
        infos[right][0] -= infos[left][0]

        left += 1 // 모두 소모했으니 뒤으로 한 칸 이동
    } else {
        left += 1
        right -= 1
    }
}

print(answer)