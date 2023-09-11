let n = Int(readLine()!)!

for _ in 0..<n {
    let num = Int(readLine()!)!
    var count = 0
    var mok = 5
    
    while mok <= num {
        count += num / mok
        mok *= 5
    }
    
    print(count)
}