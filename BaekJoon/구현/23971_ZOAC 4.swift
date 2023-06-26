let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let height = 1 + inputs[2]
let width = 1 + inputs[3]
var row = 0
var col = 0

if inputs[0] % height == 0 {
    row = inputs[0] / height
} else {
    row = inputs[0] / height + 1
}

if inputs[1] % width == 0 {
    col = inputs[1] / width
} else {
    col = inputs[1] / width + 1
}

print(row * col)