import java.io.*
import java.math.*
import java.security.*
import java.text.*
import java.util.*
import java.util.concurrent.*
import java.util.function.*
import java.util.regex.*
import java.util.stream.*
import kotlin.collections.*
import kotlin.comparisons.*
import kotlin.io.*
import kotlin.jvm.*
import kotlin.jvm.functions.*
import kotlin.jvm.internal.*
import kotlin.ranges.*
import kotlin.sequences.*
import kotlin.text.*

/*
 * Complete the 'breakingRecords' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts INTEGER_ARRAY scores as parameter.
 */

fun breakingRecords(scores: Array<Int>): Array<Int> {
    // Write your code here
    var minValue = scores[0]
    var maxValue = scores[0]
    var cntMin = 0
    var cntMax = 0
    var array = arrayListOf<Int>()
    
    for (i in 1 until scores.size) {
        if (scores[i] > maxValue) {
            maxValue = scores[i]
            cntMax += 1
        }
        if (scores[i] < minValue) {
            minValue = scores[i]
            cntMin += 1
        }
    }
    
    array.add(cntMax)
    array.add(cntMin)
    
    return array.toTypedArray<Int>()
}

fun main(args: Array<String>) {
    val n = readLine()!!.trim().toInt()

    val scores = readLine()!!.trimEnd().split(" ").map{ it.toInt() }.toTypedArray()

    val result = breakingRecords(scores)

    println(result.joinToString(" "))
}
