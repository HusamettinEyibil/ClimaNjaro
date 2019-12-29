//
//  RequestHelper.swift
//  ClimaNjaro
//
//  Created by Hüsamettin  Eyibil on 29.12.2019.
//  Copyright © 2019 Hüsamettin  Eyibil. All rights reserved.
//

import UIKit
import Alamofire

func getWeatherData(_ cell : CellModel) -> CellModel {
    let cell = cell
    let params = ["q" : cell.cityName,
        "APPID" : apiKey]
    Alamofire.request("https://api.openweathermap.org/data/2.5/weather", method: .get, parameters: params).response { (response) in
        if response.error != nil {
            print("Error : \(response.error)")
            
        } else {
            print("Success")
            
        }
    }
    
    return CellModel()
}
