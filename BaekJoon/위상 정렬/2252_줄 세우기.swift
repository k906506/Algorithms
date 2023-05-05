let inputs = readLine().split(separator: " ").map { Int(String($0))! }
var indegrees = [Int](repeating: 0, count: inputs[0] + 1)
var graphs = [[Int]](repeating: [], count: inputs[0] + 1)

for _ in 0..<inputs[1] {
    let infos = readLine().split(separator: " ").map { Int(String($0))! }

    graphs[infos[0]].append(infos[1])
    indegrees[infos[1]] += 1
}

topologicalSort()

func topologicalSort() {
    var queue = [Int]()

    for i in 1...inputs[0] {
        if indegrees[i] == 0 {
            queue.append(i)
        }
    }

    while !queue.isEmpty() {
        let current = queue.removeFirst()
        print(current, end = " ")

        for next in graphs[current] {
            indegrees[next] -= 1

            if indegrees[next] == 0 {
                queue.append(next)
            }
        }
    }
}