let infos = readLine()!.split(separator: " ").map { Int(String($0))! }
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var counts = [Int: Int]()
var result = 0

for number in numbers {
    if counts[infos[1] - number] != nil {
        result += counts[infos[1] - number]!
    }

    if counts[number] == nil {
        counts[number] = 1
    } else {
        counts[number] = counts[number]! + 1
    }
}

print(result)