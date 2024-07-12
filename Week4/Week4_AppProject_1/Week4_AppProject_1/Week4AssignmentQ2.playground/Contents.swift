/*:
There are several methods defined in the UITableViewDataSource protocol. Which methods are called by the system after we manually call reloadData() of a table view and what are their sequences? Please describe in as much detail as possible.


    因為作業規範有提到會有兩個 section ， 所以我的第一個 function 是 numberOfSections ，這個函式的用意是定義在一個 collection 中有多少 section 。
     
    接下來是兩個 UITableViewDataSource protocol 所要遵循的 func tableView ，分別以 numberOfRowsInSection 和 cellForRowAt 做為 parameter ，前者要求輸出一個 section 中 row 的數量，後者要求輸出一個 row 中 UITableViewCell 的相關設置。
     
    在func tableView(cellForRowAt) 中，會創造一個UITableViewCell屬性的 instance ，可以透過對 TableView 進行 dequeueReusableCell() 來獲取 cell instance，並且在進行設置後在 func 中 return 。

