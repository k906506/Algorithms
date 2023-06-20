/*
백준 1863 - 스카이라인 쉬운거
분류 - 스택
풀이 과정 - 스택 내에 새로 입력된 원소보다 큰 원소가 있는지를 확인, 그렇지 않다면 원소를 추가
시간 복잡도 - O(N^2)
*/

let n = Int(readLine()!)!
var stack = [0]
var ans = 0

for _ in 0..<n {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }

    if infos[1] > stack.last! {
        ans += 1
        stack.append(infos[1])
    } else {
        while !stack.isEmpty, infos[1] < stack.last! {
            _ = stack.removeLast()
        }

        if infos[1] > stack.last! {
            ans += 1
            stack.append(infos[1])
        }
    }
}

print(ans)