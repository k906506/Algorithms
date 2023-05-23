let t = Int(readLine()!)!
let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }

for _ 0..<inputs[1] {
    let points = readLine()!.split(separator: " ").map { Int(String($0))! }
    print(points[0] - 1)  
}