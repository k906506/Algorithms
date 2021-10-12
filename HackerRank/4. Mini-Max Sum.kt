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
 * Complete the 'miniMaxSum' function below.
 *
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

fun miniMaxSum(arr: Array<Int>): Unit {
    // Write your code here
    var maxValue : Double = 0.0
    var minValue : Double = Double.MAX_VALUE
    for (i in 0..arr.size - 1) {
        var total : Double = 0.0
        if (i == 0) {
            for (j in 1..arr.size - 1) {
                total += arr[j]
            }
        } else if (i == arr.size - 1) {
            for (j in 0..arr.size - 2) {
                total += arr[j]
            }
        }
        else {
            for (j in 0..i - 1) {
                total += arr[j]
            }
            for (j in i + 1..arr.size - 1) {
                total += arr[j]
            }
        }   
        if (maxValue < total) {
            maxValue = total   
        }
        if (minValue > total) {
            minValue = total
        }
    }
    println("${String.format("%.0f", minValue)} ${String.format("%.0f", maxValue)}")
}

fun main(args: Array<String>) {

    val arr = readLine()!!.trimEnd().split(" ").map{ it.toInt() }.toTypedArray()

    miniMaxSum(arr)
}
