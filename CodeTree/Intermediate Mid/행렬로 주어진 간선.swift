
let INF = 2147483647
let n = Int(readLine()!)!
var graphs = [[Int]](repeating: [Int](repeating: INF, count: n + 1), count: n + 1)

for i in 1...n {
    let infos = readLine()!.split(separator: " ").map { Int(String($0))! }

    for j in 1...n {
        if infos[j - 1] == 1 || i == j {
            graphs[i][j] = 1
        }
    }
}

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            graphs[i][j] = min(graphs[i][j], graphs[i][k] + graphs[k][j])

            // 다른 방법
            // 길이 주어진 경우에 graphs[i][j]를 1로 초기화하고, i -> k 와 k -> j 가 이동할 수 있는 길인지 확인
            // if graphs[i][k], graphs[k][j]:
            //     graphs[i][j] = 1
        }
    }
}

for i in 1...n {
    for j in 1...n {
        print(graphs[i][j] != INF ? 1 : 0, terminator: " ")
    }
    
    print()
}