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
 * Complete the 'extraLongFactorials' function below.
 *
 * The function accepts INTEGER n as parameter.
 */

fun extraLongFactorials(n: Int): Unit {
    // Write your code here
    var answer = 1.toBigInteger()
    for (i in 1..n) {
        answer *= i.toBigInteger()
    }
    println(answer)
}

fun main(args: Array<String>) {
    val n = readLine()!!.trim().toInt()

    extraLongFactorials(n)
}
