var str = readLine()!.map { String($0) }
var cnt = 0
var substrCnt = 0
var ans = 2147483647

// a의 개수
for e in str {
    if e == "a" { cnt += 1 }
}

// 원형이므로 연산의 편의를 위해 연장
str += str

for i in 0..<str.count - cnt {
    substrCnt = 0
    
    for j in i..<i + cnt {
        if str[j] == "b" { substrCnt += 1 }
    }
    
    ans = min(ans, substrCnt)
}

print(ans)

extension String {
    subscript(index: Int) -> String {
        get {
            return String(self[self.index(self.startIndex, offsetBy: index)])
        }
    }
}