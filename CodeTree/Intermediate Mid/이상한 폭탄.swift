
let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var bombs = [Int: Int]()
var answer = 0

for index in 0..<inputs[0] {
    let number = Int(readLine()!)!

    if bombs[number] == nil {
        bombs[number] = index + inputs[1]
    } else {
        if index <= bombs[number]! {
            answer = max(answer, number)
        }

        bombs[number] = index + inputs[1]
    }
}

print(answer)