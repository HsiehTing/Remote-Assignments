/*:
 (Advanced) Please complete the following function that prints a pyramid made of asterisks.
 
     func printPyramid(layers: Int) {
         
         for i in 0 ..< layers {
             
             var space = ""
             
             for _ in 0 ..< layers - i - 1 {
                 space += " "
             }
             for _ in 0 ..< 2 * i + 1 {
                 space += "*"
             }
             print(space)
         }
     }

 printPyramid(layers: 5)
 For example, here’s what the output of   should be:
 
         *
        ***
       *****
      *******
     *********
 
 
 (Optional) Do you have any App ideas that you are interested in and want to develop? List them along with a brief description (2 sentences at most), and no need to consider the availability, required techniques and business models at all.
 
    我想做一個評論平台（可能是專門評論手搖飲或咖啡廳的），用戶可以新增評論、照片還有透過 google api 找到最近的店家，然後平台可以針對品項、店家的熱門程度做出排行或推薦。
 */




