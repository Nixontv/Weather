//
//  Model.swift
//  Weather2.0
//
//  Created by Nikita Velichko on 26/06/2019.
//  Copyright © 2019 Nikita Velichko. All rights reserved.
//

import Foundation

struct all: Codable{
    var list: [List]?
    var city: City?
}

struct City: Codable{
    var name: String?
    var country: String?
}

struct List: Codable{
    var dt: Int?
    var main: Main?
    var weather: [Weather]?
    var wind: Wind?
    var dtTxt: String?
    
    enum CodingKeys: String, CodingKey{
        case dt, main, weather, wind
        case dtTxt = "dt_txt"
    }
}

struct Main: Codable{
    var temp: Float?
}

struct Weather: Codable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct Wind: Codable {
    var speed: Float?
    var deg: Float?
}
