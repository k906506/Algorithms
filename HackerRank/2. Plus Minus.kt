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
 * Complete the 'plusMinus' function below.
 *
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

fun plusMinus(arr: Array<Int>): Unit {
    var plus = 0
    var minus = 0
    var zero = 0
    
    for (i in 0..arr.size-1) {
        if (arr[i] > 0) {
            plus += 1
        }
        else if (arr[i] < 0) {
            minus += 1
        }
        else {
            zero += 1
        }
    }
    
    println(plus.toFloat()/arr.size)
    println(minus.toFloat()/arr.size)
    println(zero.toFloat()/arr.size)
}

fun main(args: Array<String>) {
    val n = readLine()!!.trim().toInt()

    val arr = readLine()!!.trimEnd().split(" ").map{ it.toInt() }.toTypedArray()

    plusMinus(arr)
}
