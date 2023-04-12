let s = readLine()!.map { String($0) }
var infos = [String: Int]()
var result = "None"

for e in s {
    if infos[e] == nil {
        infos[e] = 1
        
        if result == "None" {
            result = e
        }
    } else {
        if result == e {
            result = "None"
        }
    }
}

print(result)