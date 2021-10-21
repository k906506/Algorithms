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
 * Complete the 'timeConversion' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */

fun timeConversion(s: String): String {
    // Write your code here
    var array = arrayListOf<String>()
    
    s.split(":").toTypedArray().map{array.add(it)}
    
    if (array[2].contains("AM") && array[0].toInt() >= 12) {
        array[0] = (array[0].toInt() - 12).toString()
        if (array[0] == "0") array[0] = "00"
    } else if (array[2].contains("PM") && array[0].toInt() < 12) {
        array[0] = (array[0].toInt() + 12).toString()
    }
    
    array[2] = array[2].slice(0..1)
    var answer = array.joinToString(":")
    
    return answer
}

fun main(args: Array<String>) {
    val s = readLine()!!

    val result = timeConversion(s)

    println(result)
}
