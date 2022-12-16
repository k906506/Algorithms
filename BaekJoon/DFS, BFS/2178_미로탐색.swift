//
//  main.swift
//  AlgorithmCommandLine
//
//  Created by 고도 on 2022/12/16.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var maps: [[Int]] = []
var check: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: input[1]), count: input[0])

for _ in 0..<input[0] {
    let info = readLine()!.map { Int(String($0))! }
    maps.append(info)
}

move()

print(check[input[0] - 1][input[1] - 1])

func move() {
    var queue: [(Int, Int)] = []
    
    queue.append((0, 0))
    check[0][0] = 1
    
    while !queue.isEmpty {
        let e = queue.removeFirst()
        
        let dx = [0, 0, -1, 1]
        let dy = [-1, 1, 0, 0]
        
        for i in 0..<4 {
            let nx = e.0 + dx[i]
            let ny = e.1 + dy[i]
            
            if 0 <= nx, nx < input[0], 0 <= ny, ny < input[1] {
                if maps[nx][ny] == 1, check[nx][ny] == 0 {
                    check[nx][ny] = check[e.0][e.1] + 1
                    queue.append((nx, ny))
                }
            }
        }
    }
}