
/*:
 
 軟體人才培訓學院  iOS Class**
 Remote Learning Assignment - Week 2

 **Part 1: Object-Oriented Swift**

 ## 1. Declare a class Animal with a property gender and a method eat() . The data type of gender should be enum Gender as below and when you call eat() method, it will print “I eat everything!”

 ```
 enum Gender {
     case male

     case female

     case undefined
 }

 ```
 ```
 class Animal {
     enum Gender {
         case male
         
         case female
         
         case undefined
     }
     
     func eat() -> String {
         return "I eat everything!"
     }
 }
 ```
 ## 2. Declare three classes: Elephant , Tiger , Horse that inherits from Animal and override the eat() method to print what they usually eat.
 ```
 class Elepnent: Animal{
     override func eat () -> String {
         return "I eat fruit."
     }
 }

 class Tiger: Animal{
     override func eat () -> String {
         return "I eat meat."
     }
 }

 class Horse: Animal {
     override func eat () -> String {
         return "I eat grass."
     }

 }
 ```
 ## 3. Declare a class Zoo with a property weeklyHot which means the most popular one in the zoo this week. The codes below can’t work correctly, please find what data type should A be and solve the problem. Note that tiger , elephant , and horse are instances of class Tiger, Elephant, and Horse respectively.

     class Zoo {

     var weeklyHot: A
     init(weeklyHot: A) { }

     }
     let zoo = Zoo(weeklyHot: Tiger())

     zoo.weeklyHot = tiger
     zoo.weeklyHot = elephant
     zoo.weeklyHot = horse`
     
 這個問題與swift class 的多態性（polymorphism）有關，多態性的意思是在 Swift 中可以透過parent class 的變數來引用 subclass 的物件。當 WeeklyHot 要是某一類型別，而這些型別要剛好可以被 Tiger、Elephant、Horse 服從，那就是他們的 parentclass ‘Animal’

 ## 1. What is an instance? What does Initializer do in Class and Struct?

 instance（實例）和 type（屬性）是相對的案例，type 用於儲存 class 或 struct 的內部屬性，而instance 則是將 type 實體化，並且提供存取使用。

  在 Class 中 initializer 是必要出現的，在創建 instance 之前 Class 需要將每個 type 都定義好初始的值或是單純定義一個屬性，好讓 class 外部的 instance 來使用到 class 內的物件。

 在 Struct 中，initializer 不是必要出現的，他僅有為struct 創建一個預設值的作用。
 ## 2. What’s the difference between Struct and Class ?
 1. instance，Swift 是將其視為原先 struct 的複製體並且在記憶體是存去在不同的位置，所以如果藉由 instance 改變其值，原本 struct 內部的直視不會改變的。而 Class 屬於 reference type，在建立 instance 時是把原先的值傳遞出去，因此如果透過 instance 更改其值，會連同原本 Class 的值也一起改變
 2. Class 有 inheritance 的性質，可以擁有 subclass ，而 Struct 不能繼承 Struct
 3. Class 和 Struct 的 initializer 功能不同，規範也不同
 4. 在定義 instance 時，Struct 如果用 let 宣告，所有屬性都無法被修改，但在 Class 中就算使用 let 宣告，也可以在 instance 中修改原先定義的值
 ## 3. What’s the difference between reference type and value type ?
 如果藉由 value type 的 instance 改變其值，原本 Struct 內部的直視不會改變，因爲在建立 instance 時，Swift 是將其視為原先 struct 的複製體並且在記憶體是儲存在不同的位置。而如果透過 instance 來更改reference type 的值，會連同原本 Class 的值也一起改變，因為reference type 是傳遞（共用）同一份資料。

 ## 4. What’s the difference between instance method and type method ?
 instance（實例）和 type（屬性）是相對的案例，type method 用於定義 class 或 struct、enum 的內部屬性，而instance method 則是將 type 實體化，並且提供存取使用。

 ## 5. What does self mean in an instance method and a type method respectively?
 兩者的區別主要是引用的對象不同，instance method 中的 self 引用的是當下 method 所屬的 instance，而 type method 中的 self 同樣也引用至該 type。

 ## **Part 2: Enumerations and Optionals in Swift**

 ## 1. There are several gasoline types, 92, 95, 98, and diesel that we can use enum to model them.

 ## - ● Please declare an enum named Gasoline to model gasoline.
 ```
 enum Gasoline {
     case gasoline92
     case gasoline95
     case gasoline98
     case gasolineDiesel
 }
 ```
 ## - ● Every kind of gasoline has its price. Please declare a computed property named price and a method named getPrice separately in Gasoline enum that both will return different prices depending on different gasoline.
 ```
     enum Gasoline {
         case gasoline92
         case gasoline95
         case gasoline98
         case gasolineDiesel

     func price() -> Int {
         switch self {
         case .gasoline92:
             return 100
         case .gasoline95:
             return 105
         case .gasoline98:
             return 110
         case .gasolineDiesel:
             return 115
         }
     }
     
     var getPrice: Int {
         switch self {
         case .gasoline92:
             return 100
         case .gasoline95:
             return 105
         case .gasoline98:
             return 110
         case .gasolineDiesel:
             return 115
         }
     }
     
 }
 ```

 ## - ● Please establish raw values for . The data type of raw value should be String. For example, should be “92”.


 ```
 enum Gasoline: String {
     case oil92 = "92"
     case oil95 = "95"
     case oil98 = "98"
     case oilDiesel = "100"
 }
 ```
 ## - ● Please explain what enum associated value is and how it works.
 enum 中的 associated value 定義了 case 的型別，舉一個類似的例子，一個產品包裝有兩種條碼，雖然外型不同但都服從條碼的規範，並且不會同時出現，一個是由不同個0~9的數字組成的一維條碼，一個是一串字串組成的二維條碼，兩個條碼不同的組成方式就是 associated value 所定義的。

 raw value: 儲存的是 case 的值，而非 associated value 儲存的型態，在輸入 raw value 時需要給 enum 定義一個 type
 ## 2. Optional is a very special data type in Swift. Take var a: Int? = 10 for example, the value of a will be nil or Int . You should have learned how to deal with Optional.
     
 ##  - ● People would like to have pets, but not everyone could have one. Declare a class Pet with name property and a class People with pet property which will store a Pet instance or nil. Please try to figure out what data type is suitable for these properties in Pet and People.
 ```
 class Pet {
     var name: String? = "Dog"
 }

 class People {
     var pet: Pet?
     init(pet: Pet? = nil) {
         self.pet = pet
     }
 }
 ```
 ## - ● Please create a People instance. Use guard let to unwrap the pet property and print its name.
 ```
 let people = People(pet: Pet())

 func unwrapProperty(people: People) {
     guard let pet = people.pet  else {
         print("didn't have a pet")
         return
     }
     
     guard let petName = pet.name else {
         print("does not have a name")
         return  }
     print("Pet name is \(petName)")
 }
 unwrapProperty(people: people)
 ```
 ## - ● Please create another People instance. Use if let to unwrap the pet property and print its name.
 ```
 func unwrappedProperty(people: People) {
     if let pet = people.pet {
         print("You have a pet")
     if let petName = pet.name {
             print("Your pet name is \(petName)")
     }

     }
 }
 ```
 **Part 3: Protocol in Swift**

 ## 1. Declare a struct Person with a name property type String and a protocol name PoliceMan . There is only one method arrestCriminals with no argument in the protocol.

 ```
 protocol Policeman {
     func arrestCriminal()
 }
 ```
 ## 2. Make struct Person conform to PoliceMan protocol.
 ```
 struct Person: Policeman {
     func arrestCriminal() {
         print("arrest crimianl")
     }
 }

 ```
 ## 3. Declare a protocol ToolMan with a method fixComputer that has no argument.
 ```
 protocol Toolman {
     func fixCpmputer()
 }

 ```
 ## 4. Add a property toolMan to the struct Person with data type ToolMan .
 ```
 struct Person: Policeman, Toolman {
     func arrestCriminal() {
         print("arrest crimianl")
     }
     func fixComputer() {
         print("fix computer")
     }
 }
 ```
 ## 5. Declare a struct named Engineer that conforms to the ToolMan protocol.
 ```
 struct Enigineer: Toolman {
     func fixComputer() {
         print("fix computer")
     }
 }
 ```
 ## 6. Create a Person instance with the name “Steven” and also create the relative data you need to declare this instance.
 ```
 let person = Person(name: "Steven")
 person.fixComputer()
 ```
 ## **Part 4: Error Handling in Swift**

 ```
 enum GuessNumberGameError {
     case wrongNumber

 }
 class GuessNumberGame {


     var targetNumber = 10

     func guess(number: Int) throws {
         guard number == targetNumber else {
             throw GuessNumberGameError.wrongNumber
         }
         print("Guess the right number: \(targetNumber)")
     }

 }
 ```
 Read the code above first and paste it in the playground file, there is an error inside the
 code. Please solve the error by adding a piece of code in the file. Call guess(number:)
 and pass 20 as the argument after you fix the problem.
 ```
 enum GuessNumberGameError: Error {
     case wrongNumber

 }
 class GuessNumberGame {


     var targetNumber = 10

     func guess(number: Int) throws {
         guard number == targetNumber else {
             throw GuessNumberGameError.wrongNumber
         }
         print("Guess the right number: \(targetNumber)")
     }

 }

 do {
     let guessNumber = GuessNumberGame()
     print(try guessNumber.guess(number: 20))
 } catch let error {
     print("Error found \(error)")
 }
 ```

 **Part 5: A Simple App**

 Please implement the app by following the design below (measured in points.)

 **UI Requirements:**

 Label on the top:
 Top: 100, Leading: 40, Font size: 16, Font Color: White

 Label in the middle:
 Top: 100, Leading: 40, Trailing: 40, Font size: 16, Font Color: White

 Button:
 Bottom: 50, Leading: 40, Trailing: 40, Font size: 16, Font Color: White

 **Functional Requirements:**

 Each time the user hits the button, the background color and text should change
 randomly. We give the text below. There are 7 sentences in the array. You can choose 7
 kinds of color to cooperate with it. For example, you can take the colors of the rainbow as
 your color set.

 **Hints:**

 1. RGB color
 2. Random number in Swift

 ```
 let text = [
     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus.",
     "Contrary to popular belief, Lorem Ipsum is not simply random text.",
     "Richard McClintock, a Latin professor at Hampden-Sydney College in ",
     "looked up one of the more obscure Latin words, consectetur",
     "from a Lorem Ipsum passage, and going through the cities of the word",
     "This book is a treatise on the theory of ethics, very popular during the.",
     "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet..",



 ]
 ```

*/
