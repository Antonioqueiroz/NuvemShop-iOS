//
//  Cat.swift
//  TestNuvemShop
//
//  Created by Antonio Queiroz on 11/09/2018.
//  Copyright © 2018 Antonio Queiroz. All rights reserved.
//

import Foundation
import SwiftyJSON

class Cat{
    var imageUrl : String
    
    init(withJson data: JSON) {
        self.imageUrl = data["url"].stringValue
    }
}
