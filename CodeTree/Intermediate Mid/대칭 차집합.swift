let inputs = readLine()!.split(separator: " ")
var setA = Set<Int>()
var setB = Set<Int>()

var infos = readLine()!.split(separator: " ").map { Int(String($0))! }

for info in infos {
    setA.insert(info)
}

infos = readLine()!.split(separator: " ").map { Int(String($0))! }

for info in infos {
    setB.insert(info)
}

print(setA.symmetricDifference(setB).count)

// 합집합
setA.union(setB)
// 교집합
setA.intersection(setB)
// 대칭 차집합
setA.symmetricDifference(setB)
// 차집함
setA.substracting(setB)