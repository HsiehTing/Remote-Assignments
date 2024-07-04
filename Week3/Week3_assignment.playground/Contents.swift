/*:
1. What is a closure ? How to execute a closure?

    closure 是 function 的一種表示方式，這樣的表示方式除了可以讓指令更精簡之外，也可以幫助function轉變為另一個 function 的 input。但是 closure 不像一般 function 可以單獨存在，他只能是某個 function 的 input 或是被存在變數或常數裡。
    
    closure 的公式：把function和function name 去掉，再把 { 放到最前面，在 { 原本的地方插入 in
    
    如果 closure 當作 input 的時後，在同一個 function 內的 parameter 正好也是 closure 的 parameter，如果這個 parameter 有被賦值的話， closure 的 parameter 可以省略 reference type。
    
    如果parameter中，最後一個 input 是 closure，我們可以忽略最後一個 parameter name，把他加在括號的後面就好
    
    swift 可以進行 anonymous parameter 第一個 parameter 是 $0 第二個是 $1 。
    

3. Please declare a closure whose input type is Int, output type is Bool. The functionality of this closure is to verify if the input is odd or not. Return true if it’s odd and vice versa.
```
var IsOdd = { (number: Int) -> Bool in
    if number % 2 == 0 {
        return false
    } else {
        return true
    }
}
```

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
```
```
func printTriangle(layers: Int) {
    var i = 1
    var stack = ""
    while i <= layers {
        stack += "*"
        i += 1
        print(stack)
    }
}
```
4. Please implement the UI design below in a new app. This is a simple log-in and sign-up
page.
● Only consider iPhone 15 Pro screen size when implementing this app.

● Here’re the UI requirements (measured in point.)
○ AppWorks School label : top 80 to status bar, horizontally center in         super view. Font size 40.0
    
○ Segmented Control : top 70 to AppWorks label, width 150, horizontally
    center in super view.
    
○ Gray View : width 255, height 125, top 40 to segmented control,             horizontally center in super view.

○ Button : width 235, height: 30, top 50 to gray view, horizontally center     in super view
    
● Functional requirements:
○ When users switch to the login page through segmented control, the check
label and its text field should be disabled and their colors should be updated.

○ When users touch the button, the app should execute log-in or sign-up flow,
depending which segment is selected.

○ If there is no valid text, including empty input or wrong input, you should show a corresponding alert to users.

○ In the log in scenario, for now only the info below is acceptable.
Account: appworks_school / Password: 1234

○ In the sign up scenario, the account is always valid except for empty input.
The password text must be equal to the check text, otherwise it’s invalid.

 */
