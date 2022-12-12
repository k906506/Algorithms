func solution(_ s: String) -> String {
    var ans: String = ""
    var temp: String = ""
    var state: Bool = true

    for e in s.lowercased() {
        var word: String = String(e)

        if word == " " {
            if state {
                ans += temp + word
                temp = ""

                state = false
            } else {
                ans += word
            }
        } else { 
            if temp.isEmpty {
                let ascii: Int = Int(UnicodeScalar(word)!.value)

                if 97 <= ascii && ascii <= 122 {
                    temp += String(UnicodeScalar(ascii - 32)!)
                } else {
                    temp += word
                }

                state = true
            } else {
                temp += word
            }
        }
    }

    ans += temp

    return ans
}