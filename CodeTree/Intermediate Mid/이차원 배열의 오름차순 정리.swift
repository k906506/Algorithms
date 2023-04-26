/*
n이 최대 10^5이므로 n*n은 10^10, 10억 -> 단순히 정렬 후에 직접 접근하는 것은 시간 초과
따라서 직접 계산하지 않고, 수를 가정하고 Parametric Search를 진행
*/

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var start = 1
var end = n * n
var mid = 0
var answer = n * n

while start <= end {
    mid = (start + end) / 2

    // 같은 행들의 값은 1 * row, 2 * row, 3 * row, ... , n * row 값을 가짐
    // 따라서 target / row = target보다 같거나 작은 수의 개수
    // 하지만 n개의 col 있으므로 최대 개수는 n개, row가 커질수록 이는 더 작아짐
    var cnt = 0
    for i in 1...n {
        cnt += min(n, mid / i)
    }

    if cnt >= k {
        end = mid - 1
        answer = min(answer, mid)
    } else {
        start = mid + 1
    }
}

print(answer)