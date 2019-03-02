import kotlin.random.Random
import java.time.LocalDateTime


class Insertion(var A: IntArray){
    fun sort(): Unit{
        for (j in 1..A.size-1){
            var key = A[j]
            var i = j - 1
            while (i > -1 && A[i] > key){
                A[i + 1] = A[i]
                i = i - 1
            }
            A[i + 1] = key
        }
    }
}

fun main(){
    var A = IntArray(1000000){Random.nextInt(0,100)}
    for (i in 0..A.size-1) println(A[i])

    val sorting = Insertion(A)
    var StartTime : Long = System.currentTimeMillis()
    sorting.sort()
    var EndTime : Long = System.currentTimeMillis()
    var duration : Long = EndTime - StartTime
    println(); for (i in 0..A.size-1) println(A[i])
    println("Tempo: " + duration)
}