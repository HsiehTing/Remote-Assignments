/*:
3. Please declare a closure whose input type is Int, output type is Bool. The functionality of this closure is to verify if the input is odd or not. Return true if it’s odd and vice versa.
 */
//var IsOdd = { (number: Int) -> Bool in
//    if number % 2 == 0 {
//        return false
//    } else {
//        return true
//    }
//}
/*:
3. Please complete the following function that prints a triangle made of asterisks.
```
func printTriangle(layers: Int) {
 // TODO: print a triangle
}
```
For example, here’s what the output of printTriangle(layers: 5) should be:
```
*
**
***
****
*****
 */
func printTriangle(layers: Int) {
    var i = 1
    var stack = ""
    while i <= layers {
        stack += "*"
        i += 1
        print(stack)
    }
}

printTriangle(layers: 5)
