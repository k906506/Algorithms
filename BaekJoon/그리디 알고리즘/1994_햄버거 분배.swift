let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
var orders = readLine()!.map { String($0) }
var cnt = 0

for i in 0..<inputs[0] {
    if orders[i] == "P" {
        let minRange = max(i - inputs[1], 0) // 탐색 최소 범위
        let maxRange = min(i + inputs[1] + 1, inputs[0]) // 탐색 최대 범위
        
        for j in minRange..<maxRange {
            if orders[j] == "H" {
                orders[j] = "E" // 섭취한 햄버거를 표시하기 위해 다른 문자로 변경
                cnt += 1
                break
            }
        }
    }
}

print(cnt)

extension String {
    subscript(index: Int) -> String {
        get {
            return String(self[self.index(self.startIndex, offsetBy: index)])
        }
    }
}