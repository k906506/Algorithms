//
//  main.swift
//  AlgorithmCommandLine
//
//  Created by 고도 on 2022/12/16.
//

import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var graph: [[Int]] = [[Int]](repeating: [], count: n + 1)
  
    for (idx, e) in input.enumerated() {
        graph[idx + 1].append(e)
    }
    
    var cnt: Int = 0
    var visited: [Bool] = [Bool](repeating: false, count: n + 1)
    
    func dfs(_ e: Int) {
        visited[e] = true
        for next in graph[e] {
            if !visited[next] {
                dfs(next)
            } else {
                cnt += 1
            }
        }
    }
    
    for idx in 1...n {
        if !visited[idx] {
            dfs(idx)
        }
    }
    
    print(cnt)
}
