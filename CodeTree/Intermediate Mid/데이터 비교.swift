let n = Int(readLine()!)!
let arr1 = readLine()!.split(separator: " ").map { Int(String($0))! }

let m = Int(readLine()!)!
let arr2 = readLine()!.split(separator: " ").map { Int(String($0))! }

let set1 = Set(arr1)

for e in arr2 {
    print(set1.contains(e) ? 1 : 0, terminator: " ")
}