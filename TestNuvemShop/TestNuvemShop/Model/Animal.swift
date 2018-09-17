//
//  Animal.swift
//  TestNuvemShop
//
//  Created by Antonio Queiroz on 11/09/2018.
//  Copyright © 2018 Antonio Queiroz. All rights reserved.
//

import Foundation
import SwiftyJSON

class Animal{
    var imageUrl : String
    var breeds: [Breed] = []
    
    init(withJson data: JSON) {
        self.imageUrl = data["url"].stringValue
        let arrayBreeds = data["breeds"].arrayValue
        for breed in arrayBreeds{
            let data = Breed(withJson: breed)
            breeds.append(data)
        }
    }
}
