//
//  Network.swift
//  Weather2.0
//
//  Created by Nikita Velichko on 26/06/2019.
//  Copyright © 2019 Nikita Velichko. All rights reserved.
//

import Foundation
import Alamofire

class WebApi{
    func getWeather(completed: @escaping (_ alls: all) -> Void){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=Minsk&appid=ca36116c38790a785f7ae77472fbd2a7") else {return}
        Alamofire.request(url,method: .get).responseJSON {
            (response) in
            
            if response.result.isSuccess{
                guard let data = response.data else {return}

                do{
                    let myResponse = try JSONDecoder().decode(all.self, from: data)
                    completed(myResponse)
                }
                catch let error{
                    print(error.localizedDescription)
                }
            }
        }
    }
}

