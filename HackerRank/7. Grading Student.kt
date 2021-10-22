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
 * Complete the 'gradingStudents' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts INTEGER_ARRAY grades as parameter.
 */
 
 fun roundInt(number : Int) : Int {
     var roundNumber = number / 10
     var result = number - roundNumber * 10
     if (result <= 5) {
         return roundNumber * 10 + 5
     } else {
         return roundNumber * 10 + 10
     }
 }

fun gradingStudents(grades: Array<Int>): Array<Int> {
    var result = arrayListOf<Int>()
    // Write your code here
    for (number in grades.iterator()) {
        var roundNumber = roundInt(number)
        if (roundNumber < 40) {
            result.add(number)
        } else {
            if (roundNumber - number < 3) { result.add(roundNumber)}
            else { result.add(number)}  
        }
    }
    return result.toTypedArray<Int>()
}

fun main(args: Array<String>) {
    val gradesCount = readLine()!!.trim().toInt()

    val grades = Array<Int>(gradesCount, { 0 })
    for (i in 0 until gradesCount) {
        val gradesItem = readLine()!!.trim().toInt()
        grades[i] = gradesItem
    }

    val result = gradingStudents(grades)

    println(result.joinToString("\n"))
}
