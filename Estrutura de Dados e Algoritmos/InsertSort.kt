import kotlin.random.Random

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
    var A = IntArray(100){Random.nextInt(0,100)}
    for (i in 0..A.size-1) println(A[i])
    val sorting = Insertion(A); sorting.sort()
    println(); for (i in 0..A.size-1) println(A[i])
}