//
//  ViewController.swift
//  week2_assignment
//
//  Created by 謝霆 on 2024/6/27.
//

import UIKit
var i: Int = 0
var colorRed: CGFloat?
var colorGreen: CGFloat?
var colorBlue: CGFloat?

let text = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus.",
    "Contrary to popular belief, Lorem Ipsum is not simply random text.",
    "Richard McClintock, a Latin professor at Hampden-Sydney College in ",
    "looked up one of the more obscure Latin words, consectetur",
    "from a Lorem Ipsum passage, and going through the cities of the word",
    "This book is a treatise on the theory of ethics, very popular during the.",
    "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet..",
]

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textLabel.text = "You are born with 300 bones; by the time you are an adult you will have 206"
    }
func randomNumber() {
     i = Int.random(in: 0...text.count - 1)
    colorRed = CGFloat.random(in: 0 ... 255)
    colorGreen = CGFloat.random(in: 0 ... 255)
    colorBlue = CGFloat.random(in: 0 ... 255)

    }
func changeText() {
        textLabel.text = text[i]
    }
func changeBackGroundColor() {
    self.view.backgroundColor = UIColor(red: colorRed!/255, green: colorGreen!/255, blue: colorBlue!/255, alpha: 1.0)
    print(colorRed, colorGreen, colorBlue)
    }

@IBAction func changeTextButton(_ sender: UIButton) {

    randomNumber()
    changeText()
    changeBackGroundColor()
    }

}

