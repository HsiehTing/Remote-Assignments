/*:
## Part 1: Git & GitHub

## 1. Please create a public GitHub repository named “Remote-Assignments” for uploading your homework. Please send your repository link to us through Discord direct message and we will check your assignments through your repository every week. We need you to structure your folders as below:
    - Remote-Assignments
        - week1
            - [your assignments]
        - week2
            - [your assignments]
        - week3
            - [your assignments]
        - week4
            - [your assignments]


## 2. Here are some Git and GitHub commands we usually use in software development. Please explain the meanings and use cases of them.


### a. git status :
檢查 working directory和 staging area 的「狀態」，其中包含了檔案中哪些檔案沒被track到、哪些檔案修改後還沒commit、哪些檔案staged後還沒commit。

### b. git diff:
顯示目前的 working directory 和 staging area 有什麼差異，可以使用 `git diff —-staged` 或 `git diff —-cached`來比較staging area 和 working directory 的差異。

### c. git add：
如果在部署 directory 內新增了一個資料，輸入 status 會發現他是 untracked 的狀態，意味著 git 無法追蹤，這時需要輸入 `git add` + 檔案名，將資料加入 staging area，確保檔案是 tracked 的狀態，並且在下次 commit 中被連帶送到 repository。

### d. git reset：
reset 可以對修改的內容進行取捨，同時指定當前的HEAD回到某一個特定的commit。分為 mixed（預設）、soft、hard ，mixed是將staging area 的變更檔案丟掉，但保留 working directory 的檔案；soft 會保留 staging area 和 working directory 的變更 ，hard 則是將 staging area 和 working directory 的變更檔案都會被丟掉，並且還原到某一個commit。

### e. git commit：
類似遊戲中的存檔點，可以將 staged 的變更提交到 Repository 變成一個版本，方便後續管理檔案版本， `git commit -m` `"<填寫版本資訊>"`可以在執行commit的同時直接填寫 commit 紀錄。

### f. git log：
查看 commit 的歷史紀錄，其中的資訊包含了每次做出commit 的 meta data、作者、時間，`git log -p` 可以看到不同 commit 的詳細修改資訊，`git log —all —oneline —graph — decorate` 可以看到完整的 branch 示意圖和 commit 的資訊。

### g. git branch：
每個 commit 都有一個或兩個 parents，這樣的關係透過 SHA 1 包裝成 hash 的形式，我們可以透過這些 hash來識別特定的commit ，而branch 則是識別這些子母關係hash的指標。git branch 指令可以創造一個新的branch，例如：`git branch myBranch` 。要刪除一個branch 可以加上 -d 變成 `git branch -d myBranch` 。然而，如果一個branch 沒有 fully merged ，意味著如果刪除掉了這個branch，上面的commit將不會跟其他 branch 有 reference 關係 ，git 不會直接讓你用 `-d` 來刪除，如果要的話可以使用 `-D`  來強制刪除 branch。

### h. git merge：
merge 代表將不同 branch 的 commit 融合成一個 commit 。用法是 git merge ＋ 要 merge 的 commit。假設我們有一個 master branch 的commit A，我們在A的基礎上創造另ㄧ個 branch 並且創造commit B ，再進一步更新內容創造commit C，如果我們將 A 和 C 進行 merge，因為兩者還是存在直線上的關係，即便經過 merge 卻沒有因此創造一個新的commit，這樣稱作 fast forward merge 。

### i. git push [repo_name] [branch_name]：
將本地的資料上傳到 remote(git hub 雲端) 的 repository。

### j. git remote：
用來檢視雲端版本的 repository ，`git remote -v` 可以看到簡稱還有 URL，git remote  add 可以指定簡稱還有 URＬ來創建新的 repository。

### k. fork:
fork 讓我們可以在既有的專案中複製一個新的專案，並且擁有該複製專案的所有權。另外，也可以透過發送 pull request 將 fork file 輸出回原先的專案 ，當原來的擁有者同意pull request 後就能完成兩個檔案的 merge。

### l. (Advanced) git rebase：
rebase 和 merge 一樣，都是在達成兩個 commit 的融合，但概念卻有所不同。比起 merge 是將兩個 branch 的最後的節點 （commit）合而為一，rebase 則是將其中的 branch 融合在一起，雖然犧牲了其中一個 branch ，但該 branch 的 commit 卻承接了新的 SHA-1 值，在新的 branch 上重獲新生，以下詳述過程。
base指的是一個branch 的根基，假如 master branch 中同時分開了 A 和 B branch ， A、B branch 的 base 就同時是 master 區分兩個 branch 時的 commit。 rebase 代表重新定義一個 branch 的 base ，假設 HEAD 為 Branch A，我輸入指令 `git rebase b` 將他的 base 重新定義為 B，這時 A 的 base 就會從本來的 master branch 上轉變為 B 的最後一個 commit，這也代表了 branch A 失去了對 master branch 的 reference。 原本 branch A 的第一個 commit 因為連接的 base 有所改變所以 SHA-1 值會重新計算，連帶後面的 commit 也是同理。在 branch A 的節點依序連接後，最後變成 branch B 的最後一個節點是原先 branch A 的最後一個節點。

### m. (Advanced) git cherry-pick：
cherry-pick 可以複製其他 branch 的特定 commit。在 `git cherry-pick` 後輸入特定commit 的 id 就可以將該 commit 接續並且合併到 HEAD 所在的 branch。

### n. (Advanced) git reflog：
reference vlog的縮寫，他就像是 log 的日記，幫助記憶所有 commit 的 id，通常對回復 reset 造成的誤刪資料很有幫助。舉例來說，在 HEAD branch 有編號 1 ~ 4 的 commit ，我們誤將 reset 到編號 2 的指令設置成 hard，這樣一來我們就失去了 3、4 號 commit  的 reference，不幸中的大幸是我們可以透過 reflog 找到先前登入過的 commit id 順利取得 3、4 號 commit。

### o. (Advanced) git tag：
git tag 顧名思義可以幫助分類以及識別 commit ，用法是在 `git tag`後方加上 tag 內容，再輸入目標 commit ID 就完成標籤了，如果沒有特別備註 ID 則會對現在的commit 加上 tag。tag 有兩種，預設的是輕量標籤（lightweight tag），另外一種是附註標籤（annotated tag），如果要加上附註標籤需要加上 `-a` 並且自訂附註內容。兩者差別是標籤內容的多寡，附註標籤除了可以手動留下較多資訊，也會自動留下作者、時間。刪除標籤並不會影響檔案，只要在標籤內容前加上 `-d` 即可。

## 3. Please describe how to establish a GitHub repo and how to upload the local projects to GitHub. Try to explain your answers with as much detail as possible.
如果要將本地的資料上傳到 GitHub 大致可以分為三個步驟：1. 建立 repository 2. 建立 local directory 3. 將 local directory push 到 remote

1. 建立 repository : repository 屬於 remote 的範疇，我們需要先分別將 remote 和 local 的環境架設好，再將兩者串接，最後達成上傳本地資料到 GitHub 的功能。repository 的建立可以在網頁上完成：
    1. 點進 GitHub 頁面，並完成註冊或登入
    2. 進入主頁後在右上方的 「＋」選取下拉表單的 New repository。
    3. 填寫 Repository name，名字盡量與專案內容適切，我命名為 git_practice，另外可以選擇是否將 repository 公開，以及是否要先輸入 read me file 和 license ，以上兩個設置可以等建置完成後再進行。完成後點選右下角的 Create repository。
    4. 進入 repository 頁面後就算新增成功了
    5. 中間反藍的是該 repository 的 URL，在串連本地和 remote 時會用到

1. 建立 local directory： 大部分的程式撰寫工作都是在本機執行，我們理論上可以把所有開發內容利用 drag and drop 的方式放到 GitHub 並且在上面篩選、管理，但這樣不夠直觀，而且人工還是容易出錯，git hub 提供了 git 這樣的工具幫助我們方便的在終端機就能部署、管理檔案，以下是建制本機環境的流程
    a.  進入 terminator ，建立 directory git_practice  `mkdir git_practice`
    b.  進入 git_practice `cd git_practice`
    c.  在directory 建立一個檔案 `touch practice.txt`
    d.  在使用 git 工具之前，必須先啟動 git `git init`
    e.  現在的 local repository 中還沒有任何檔案，也沒有任何 commit 和 branch，我們先把檔案加入 staging area，. 代表所有檔案，也可用特定檔案名稱  `git add .`
    f.  再將 staging area 的檔案送交到 Commit ，備註為 “Initial commit” `git commit -m ‘initial commit’`
    g.  在完成commit 時，git 已經幫我們預設了一個 branch “main”，現在本機的架構已建置完成
2.  將 local directory push 到 remote： 現在我們要串連本機和 GitHub，這樣一來就可以透過 command line 來使用 GitHub
    a. 在 terminator 加入創建好的 remote repository，在 add 後方輸入 repository 名稱，還記得在第一階段說到會使用的 URL 嗎？複製 https 的 URL 並且在 repository 名稱後貼上`git remote add git_practice URL`
    b. 先確定 remote URL 是否成功 `git remote -v`
    c. 最後，我們用到 push將本地的檔案推到 GitHub 中，並且定義好 repository 名稱和branch 名稱（預設是main）。-u 是 `--set-upstream`的簡寫，用來為了本地的 branch 設置一個預設的 remote branch，在未來如果有其他 `git fetch` 、`git pull` 或 `git push` 需求，git 都會找到預設的 remote branch 並且將本機檔案同步到 GitHub `git push -u git_practice main`
*/
/*:
 ## Part 2: Basic
 */

/*:
  1. Please explain the difference between let and var.
 
    let 和 var 是在 swift 中我們進行物件宣告時所用到的語法，雖然兩者都是進行宣告，但用途並不相同。用 let 宣告的物件可以理解為 constant，把 var 宣告的物件為 variable ，以下說明。
 當我們進行 let 宣告時，裡面的值在執行期間無法進行修改，就像放進一個上鎖的櫃子，無法將物品拿出來。而 var 則是相反，在宣告後可以經由計算、執行函式等方式來變換內容物，放入箱子的物品可以隨時修改、替換。
 */
/*:
  2. In Swift, we usually define a variable through the syntax as below:
        
        var x: Int = 10
     
  We use the formula: `2 * radius * pi` to calculate the circumference. Now, please define a variable `pi` and assign a value to it. You can refer to the syntax above while thinking about using `var` or `let` and which data type it should be.
            
        let pi: Float = 3.1415926
    
 */
/*:3. Declare two constants x and y of type Int then assign any value to them. After that, please calculate the average of x and y and store the result in a constant named average.
 
        let x: Int = 5
        let y: Int = 10

        let average: Float = (Float(x) + Float(y))/2
       
 */

/*:4. Following Q3, now we want to save the average in a record system, but the system doesn’t accept `65` but `65.0`.
 - Please solve this problem so that we can put the average in the record system.
 - Please explain the difference between `(10 / 3)` and `(10.0 / 3.0)`.
 
    a. 系統不接受整數而只接受包含小數點後一位的值，可以判斷系統要求的應該是 Float 或是 Double，我們將 average 的    reference type 設置成 Double / Float 就可以解決
 
        let average: Float = (Float(x) + Float(y))/2
 
    b.(10 / 3) 和 (10.0 / 3.0) 前者是 Int 的型別，後者是 Double Float 型別

 */

/*:5. Declare two constants x and y of type Int then assign any value to them. After that, please calculate the average of x and y and store the result in a constant named average.
 
        let x: Int = 10
        let y: Int = 3
        let remainder: Int = x % y
        print(remainder)
       
 */

/*:6. Swift is a very powerful language that can infer the data type for you (Type Inference) while we still need to know the basics well. Please change the following codes into the ones with the type annotation.
    ex: var `x = 10` ⇒ `var x: Int  = 10`
         
        var flag: Bool = true
        var inputString: String = "Hello world."
        let bitsInBite: Int = 8
        let averageScore: Float = 86.8
         
 */

/*:7.What is Type Inference in Swift?
   
   
任何 swift 的物件不管是常數、變數、或函數都需要有 Type Inference 來進一步定義其值的類型，Type Inference 有字串 String 、布林值 Bool、整數 Int、浮點數 Float、 Double。
 */

/*:8. What is the issue about this piece of code?
 
     swift複製程式碼
     var phoneNumber = 0987654321
     phoneNumber = "Hello world."
 
    因為 phoneNumber 已經被宣告為變數 0987654321，這時 swift 已經自動將 phoneNumber 視為 Int inference type，即便身為變數可以將 phoneNumber 的值改變，但無法改變成非 Int 的內容，"Hello world." 是 String 並不是 Int
 */

/*:9. Compound assignment operators are very useful when programming. Please declare a variable `salary` with initial value `22000`, and use unary plus operator adding `28000` to `salary`, so it will be `50000` after this process.
 
         var salary: Int = 22000
         salary += 28000
         print(salary) // 50000

 */

/*:You should notice that ‘= has a different meaning in programming. In the real world, ‘= means equal while in programming, ‘=` means assign. You simply put the right-hand side data into the left-hand side variable or constant. Now please write down the Equality operator in Swift.
 
    ==

 */

/*:
 **Part 3: Collection**

 You should know how to declare an Array in Swift, and also how to add, remove, insert, read an object in an array. You should be familiar with the following syntax: `append`, `.insert`, `remove`.

 Arrays are dangerous in Swift. If you access the array with an index which is out of range, your app will crash with fatal error. Please interact with the array very carefully.
1. Please initialize an empty array with `String` data type and assign it to a variable named `myFriends`.
 
        var myFriends: [String] = []

 \
2. According to Q1, now I have three friends, ‘Ian’, ‘Bomi’, and ‘Kevin’. Please help me to add their name into `myFriends` array at once.
 
         myFriends += ["Ian", "Bomi", "Kevin"]
     or
 
         myFriends.append(contentsOf: ["Ian", "Bomi", "Kevin"])

 \
3. Oops, I forgot to add ‘Michael’ who is one of my best friends, please help me to add Michael to the end of `myFriends` array.
 
        myFriends.append("Michael")
 
        or

        myFriends.insert("Michael", at: myFriends.count)

 \
 4. Because I usually hang out with Kevin, please move Kevin to the beginning of the `myFriends` array.
 
        myFriends.swapAt(myFriends.firstIndex(of: "Kevin")!, 0)

 \
 5. Use `for...in` to print all the friends in `myFriends` array.
 
         for myFriend in myFriends {
             print(myFriend)
         }
  \
 6. Now I want to know who is at index 5 in the `myFriends` array, try to find the answer for me. Please explain how you get the answer and why the answer is it.
 \
        myFriends array 中，只有四個elements，分別是 "Kevin", "Ian", "Bomi", "Michael"，所以如果查詢第五個index會報錯
 
        print(myFriends[5])
 
        但我們也可以使用 swift 確認是否真的沒有第五個index
 
         let index = 5
         if index < myFriends.count {
             print("index 5 is available")
         } else {
             print("index 5 is not available")
         }
 
 \
        7. How to get the first element in an array? \
        使用 .first 來找到第一個 array 的 element
        
            print(myFriends.first)

 \
 8. How to get the last element in an array?\
 使用 .last 來找到最後一個 array 的 element
        
        print(myFriends.last)

 \
9. Please initialize a Dictionary with keys of type `String`, value of type `Int`, and assign it to a variable named `myCountryNumber`.
    
        myCountryNumber: [String: Int] = [:]
 
 \
 10. Please add three values `1`, `44`, `81` to `myCountryNumber` for keys ‘US’, ‘GB’, ‘JP’ respectively.
    
         myCountryNumber["US"] = 1
         myCountryNumber["GB"] = 44
         myCountryNumber["JP"] = 81
 
 \
 11. Change the value of ‘GB’ from `44` to `0`.
 
        myCountryNumber["GB"] = 0
 
 \
 12. How to declare an empty dictionary?
 
        var emptyDict: [String: Int] = [:]
 
 \
 13. How to remove a key-value pair in a dictionary?
 
    myCountryNumber.removeValue(forKey:    )
 
 
    使用的是 removevalue() ，字面上只把 value 移除了，但 key 是否還存在呢？ 因為 Dictionary 中，無法單獨出現 key 或是 value 所以當 value 移除了，key 的 value 變成 nil，表示該 key 也移除了。可以透過 print(myCountryNumber) 來檢查剩餘的 key-value。

 */

/*:
 Part 4: Control Flow

1. Here is an array:
     
     ```swift
     swift複製程式碼
     let lottoNumbers = [10, 9, 8, 7, 6, 5]
     
     ```
     
     Please use `For-In` loop and `Range` to print the last three members in the `lottoNumbers` array.
 
        for lottoNumber in lottoNumbers [3...5] {
             print(lottoNumber)
        }
 
 \
 2. Please use a `for-in` loop to print the results as the images listed below respectively (through `lottoNumbers`):
     
     ```
     複製程式碼
     5
     6
     7
     8
     9
     10
     ```
     
     ```
     10
     8
     6
     ```
 
 
         for i in lottoNumbers.reversed(){
             print(i)
         }
         
         for i in lottoNumbers.reversed() where i % 2 == 0 {
              print(i)
  }
 \
    3. Please use a `while` loop to solve the Q2.
 
         var i = lottoNumbers.count - 1

         while i >= 0 {
             print(lottoNumbers[i])
             i -= 1
         }

         var i0 = 0
         while i0 <= lottoNumbers.count - 1 {
             print(lottoNumbers[i0])
             i0 += 2
 
 \
    4. Please use a `repeat-while` loop to solve Q2.
 
         var i = lottoNumbers.count - 1

         repeat{
             print(lottoNumbers[i])
             i -= 1
         } while ( i >= 0)

         var i0 = 0
         repeat {
             print(lottoNumbers[i0])
             i0 += 2
         } while(i0 <= lottoNumbers.count - 1)

 
 \
    5. What are the differences between `while` and `repeat-while`?
 
 \
    while 和 repeat-while 最大的差別是檢查和執行的順序，while 會先檢查是否符合條件，才執行指令，再繼續檢查條件，直到條件不符合。 repeat-while 則是先執行一次程序，然後再檢查條件，檢查通過後再執行程序，直到條件不符合。
 
 
 \
    6. Declare a variable `isRaining` to record the weather. Please write a statement that if the weather is raining, print “It’s raining, I don’t want to work today.”, otherwise print “Although it’s sunny, I still don’t want to work today.”
 \
 
         var isRaining: Bool? = true

         if let isRaining {
             print("It’s raining, I don’t want to work today.")
         } else {
             print("Although it’s sunny, I still don’t want to work today.")
         }
 
 \
    7. In a company, we might use numbers to represent job levels. Let’s make an example. We use `1` for the Member, `2` for Team Leader, `3` for Manager, and `4` for Director. Now, declare a variable named `jobLevel` and assign a number to it. If the `jobLevel` number is in our list, print the relative job title name; if not, just print “We don't have this job”. Please use the `if-else` statement and the `switch` statement to complete this requirement separately.
 
             var jobLevel: Int = 4

             var jobLevelDict: [Int: String] = [1: "Member", 2: "Team Leader", 3: "Manager", 4: "Director"]

             func convertToTitle(_ jobLevel: Int) {
                 
                 if jobLevel <= jobLevelDict.count {
                     print(jobLevelDict[jobLevel]!)
                 } else {
                     print("We don't have this job")
                 }

                 }

             switch jobLevel {
             case 1, 2, 3, 4: convertToTitle(jobLevel)
             default:
                 print("We don't have this job")
             }
 */

/*:
 **Part 5: Function**

 1. What are the return types in the following statements?
     
     ```swift
     swift複製程式碼
     func birthday() -> String { }
     func payment() -> Double { }
     
     ```
    
 \
 birthday()期望回傳的是 String，payment()期望回傳的是 Double
 
 \
 2. Please declare a function named `multiply` with two arguments `a` and `b`. This function won’t return any value and will only print out the result of `a * b`. Be noticed that we want to give the argument `b` a default value of `10`.
 
         func mutiply(a: Int, b: Int = 10) {
             print(a * b)
         }
 
\
 3. What’s the difference between argument label and parameter name in a function?
 
    parameter（參數）定義了一個函式的架構，函式圍繞著 parameter 來達成特定的功能，parameter 在定義函式時就會寫出來，並且定義好refernce type，可以想像成函式內部的名稱。
    \
    argument label 則可以想像成外部的名稱，當一個函式被呼叫，所被提及到的就是 argument 外部的名稱。
 
         func travel(from hometown: String, to city: String){
         print("I travel from \(home) to \(city)")
         }

         travel(from: "Keelung", to: "LA")
 
    在定義 function 和呼叫 function 時，可能會同時寫到 parameter 和 argument。上述例子hometown, city 這類像是名詞的為 parameters，from, to 這類類似介系詞的字為 argument。這樣的區別也是 swift 需要定義 parameter 和 argument 的好處，增加了程式的可讀性。如果呼叫 funciton 不想再寫 argument 可以在定義 funciton 時在 paremeters 前面加上 _ 就可以省略arguments
 
\
 4. Please declare a function named `greet` with `person` as an argument label and `.name` as a parameter name. This `greet` function will return a `String`. For example, if you call the function `greet` like this:
     
     ```swift
     swift複製程式碼
     greet(person: "Luke")
     
     ```
     
     It will return the string: “Hello, Luke”.
 */


