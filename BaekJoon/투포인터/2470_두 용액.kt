fun main() {
        val sc = Scanner(System.`in`)
        val n = sc.nextInt()
        val array = IntArray(n) { sc.nextInt() }

        var left = 0
        var right = n - 1
        var standard = 2000000000

        var answer = IntArray(2) { 0 }

        array.sort()

        while (left < right) {
            var sum = array[left] + array[right]
            if (Math.abs(sum) < standard) {
                standard = Math.abs(sum)
                answer[0] = array[left]
                answer[1] = array[right]

                if (sum == 0) break
            }

            if (sum < 0) left++
            else right--
        }

        print("${answer[0]} ${answer[1]}")
    }
