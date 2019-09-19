//
//  ViewController.swift
//  Weather2.0
//
//  Created by Nikita Velichko on 26/06/2019.
//  Copyright © 2019 Nikita Velichko. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController{
    
    let api = WebApi()
    var myList = [all]()
    var arrayOfTemp = [String]()
    var arrayOfWeather = [String]()
    var arrayOfDate = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var currentWeather: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getWeather { (alls) in
            
            self.cityName.text = alls.city?.name
            let currentTempr = Int((alls.list![0].main?.temp)! - 273.15)
            self.currentTemp.text = "\(currentTempr.description)°"
            self.currentWeather.text = alls.list![0].weather![0].main
            
            for temps in alls.list! {
                let temreature = Int((temps.main?.temp)! - 273.15)
                self.arrayOfTemp.append("\(temreature.description)°")
            }
            
            for dates in alls.list!{
                self.arrayOfDate.append(dates.dtTxt!)
            }
            
            for wthrs in alls.list!{
                for whtrs2 in wthrs.weather!{
                    self.arrayOfWeather.append(whtrs2.main!)
                }
            }
            
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arrayOfWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.dateLabel.text = arrayOfDate[indexPath.row]
        cell.weatherLabel.text = arrayOfWeather[indexPath.row]
        cell.tempLabel.text = arrayOfTemp[indexPath.row]
        return cell
    }
    
    
}

