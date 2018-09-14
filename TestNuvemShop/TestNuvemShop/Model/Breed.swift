//
//  Breed.swift
//  TestNuvemShop
//
//  Created by Antonio Queiroz on 13/09/2018.
//  Copyright © 2018 Antonio Queiroz. All rights reserved.
//

import Foundation
import SwiftyJSON

class Breed{
    var name : String
    var weigthMetric : String
    var weigthImperial : String
    var heigthMetric : String
    var heigthImperial : String
    var life_span   : String
    var breed_group : String
    
    init(withJson data: JSON) {
        self.name = data["name"].stringValue
        self.life_span = data["life_span"].stringValue
        self.breed_group = data["breed_group"].stringValue
        let heigthData = data["height"].dictionaryValue
        heigthMetric = heigthData["metric"]?.stringValue ?? ""
        heigthImperial = heigthData["imperial"]?.stringValue ?? ""
        let weigthData = data["weight"].dictionaryValue
        weigthMetric = weigthData["metric"]?.stringValue ?? ""
        weigthImperial = weigthData["imperial"]?.stringValue ?? ""
    }
}
