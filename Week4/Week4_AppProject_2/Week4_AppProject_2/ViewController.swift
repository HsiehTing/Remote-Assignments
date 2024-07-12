//
//  ViewController.swift
//  Week4_AppProject_2
//
//  Created by 謝霆 on 2024/7/10.
//

import UIKit



class ViewController: UIViewController {
    @IBOutlet weak var stationID: UILabel!
    
    @IBOutlet weak var stationName: UILabel!
    @IBOutlet weak var address: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayResult()

    }
    
    func displayResult () {
        
        let session = URLSession(configuration: .default)
        
        let url = URL(string: "https://remote-assignment.s3.ap-northeast-1.amazonaws.com/station")
        
        var request = URLRequest(url: url!)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: url!) {
            data, response, error in

        if let data = data {
            
            do {
                let decoder = JSONDecoder()
                let station = try decoder.decode(StationData.self, from: data)
                DispatchQueue.main.async {
                    self.stationID.text = station.stationID
                    self.stationName.text = station.stationName
                    self.address.text = station.stationAddress
                }
            } catch {
                print("error decoding Json: \(error)")
            }
            }
        }
        task.resume()
    }
            
        struct StationData: Decodable {
            let stationID: String
            let stationName: String
            let stationAddress: String
        }
        
        
    }
    
