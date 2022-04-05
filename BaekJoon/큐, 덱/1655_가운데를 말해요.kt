import java.io.BufferedReader
import java.io.InputStreamReader
import java.util.*

val array = mutableListOf<Int>()
val minQueue = PriorityQueue<Int>() // 최소 힙
val maxQueue = PriorityQueue<Int>(Collections.reverseOrder()) // 최대 힙
val stringBuilder = StringBuilder()

fun main() = with(BufferedReader(InputStreamReader(System.`in`))) {
    val n = readLine().toInt()

    repeat(n) {
        array.add(readLine().toInt())
    }

    for (e in array.iterator()) {
        insert(e)
    }

    print(stringBuilder)
}

// maxQueue와 minQueue를 번갈아가면서 저장한다.
fun insert(e: Int) {
    if (minQueue.size == maxQueue.size) {
        maxQueue.add(e)
    } else {
        minQueue.add(e)
    }

    if (minQueue.isNotEmpty() && maxQueue.isNotEmpty()) {
        val min_value = minQueue.peek()
        val max_value = maxQueue.peek()

        // 만약 minQueue의 Top이 MaxQueue의 Top보다 큰 경우 이를 swap
        if (max_value > min_value) {
            minQueue.poll()
            maxQueue.poll()

            minQueue.add(max_value)
            maxQueue.add(min_value)
        }
    }

    stringBuilder.append(maxQueue.peek()).append("\n")
}
