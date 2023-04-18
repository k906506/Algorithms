let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var fires = readLine()!.split(separator: " ").map { Int(String($0))! }
var centers = readLine()!.split(separator: " ").map { Int(String($0))! }

fires.sort(by: <)
centers.sort(by: <)

var answer = 0
var right = 0

for left in 0..<inputs[0] {
    // 현재 발화 지점과 가장 거리가 짧은 소방서를 탐색
    while right + 1 < inputs[1], dist(left, right) > dist(left, right + 1) {
        right += 1
    }

    answer = max(answer, dist(left, right))

}

print(answer)

func dist(_ i: Int, _ j:Int) -> Int {
    return abs(fires[i] - centers[j])
}