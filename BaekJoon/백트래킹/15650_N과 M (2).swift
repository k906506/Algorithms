import Foundation

var input = readLine()!.split(separator: " ").map { Int(String($0))! }

var visit = [Int](repeating: 0, count: input[0] + 1) // 방문 확인
var nums = [Int](repeating: 0, count: input[0]) // 방문한 인덱스 저장

backTracking(0, 0)

func backTracking(_ depth: Int, _ before: Int) {
    if depth == input[1] {
        for i in 0..<input[1] {
            print("\(nums[i])", terminator: " ")
        }
        print("")

        return
    }

    for i in 1...input[0] {
        if visit[i] == 0 && i > before {
            visit[i] = 1 // 방문 표시

            nums[depth] = i
            backTracking(depth + 1, i)

             visit[i] = 0
        }
    }
}
