/*
1 ~ n까지의 자연수의 합이 s 이하인 수 중에서 가장 큰 n을 찾는 것
1. 우선 탐색 범위를 1 ~ s로 잡는다.
2. 이진 탐색을 통해서 범위를 줄여가는데, 1 ~ n 까지의 합은 n * (n + 1) / 2 와 같으므로 이를 통해 탐색 범위를 줄인다.
*/

let n = Int(readLine()!)!
var start = 1
var end = n
var mid = 0
var answer = 0

while start <= end {
    mid = (start + end) / 2

    if mid * (mid + 1) / 2 <= n {
        start = mid + 1
        answer = max(answer, mid)
    } else {
        end = mid - 1
    }
}

print(answer)