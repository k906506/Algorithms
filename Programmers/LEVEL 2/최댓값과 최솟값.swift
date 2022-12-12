func solution(_ s: String) -> String {
    var array: [Int] = s.split(separator: " ").map { Int(String($0))! }.sorted()
    return "\(array[0]) \(array[array.count - 1])"
}