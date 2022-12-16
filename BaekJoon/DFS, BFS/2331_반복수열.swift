//
//  main.swift
//  AlgorithmCommandLine
//
//  Created by 고도 on 2022/12/17.
//

import Foundation

func dfs(_ e: Int) {
    if visited[e] >= 3 {
        return
    }
    
    visited[e] += 1
    
    let next: Int = convertNum(e)
    dfs(next)
}

func convertNum(_ num: Int) -> Int {
    let arrayOfNums = String(num).map { Int(String($0))! }
    return arrayOfNums.map { Int(pow(Float($0), Float(input[1]))) }.reduce(0, +)
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var visited: [Int] = [Int](repeating: 0, count: 240000)

dfs(input[0])

print(visited.filter { $0 == 1}.count)