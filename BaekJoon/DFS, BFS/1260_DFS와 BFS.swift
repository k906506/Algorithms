//
//  main.swift
//  AlgorithmCommandLine
//
//  Created by 고도 on 2022/12/16.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var graph: [[Int]] = [[Int]](repeating: [], count: input[0] + 1)

for _ in (0..<input[1]) {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    graph[info[0]].append(info[1])
    graph[info[1]].append(info[0])
    graph[info[0]].sort()
    graph[info[1]].sort()
}

var visited: [Bool] = [Bool](repeating: false, count: input[0] + 1)
dfs(input[2])

print("")

visited = [Bool](repeating: false, count: input[0] + 1)
bfs()

func bfs() {
    var queue: [Int] = [input[2]]
    visited[input[2]] = true
    
    while !queue.isEmpty {
        let e: Int = queue.removeFirst()
        print(e, terminator: " ")
        
        for next in graph[e] {
            if !visited[next] {
                queue.append(next)
                visited[next] = true
            }
        }
    }
}

func dfs(_ e: Int) {
    if visited[e] {
        return
    }
    
    print(e, terminator: " ")
    visited[e] = true
    
    for next in graph[e] {
        dfs(next)
    }
}
