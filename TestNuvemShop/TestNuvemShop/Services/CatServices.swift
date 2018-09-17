//
//  AnimalServices.swift
//  TestNuvemShop
//
//  Created by Antonio Queiroz on 11/09/2018.
//  Copyright © 2018 Antonio Queiroz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class CatServices{
    var BaseUrlCats : String = "https://api.thecatapi.com/v1/images/search/?limit=50"
    
    func getCats(completion: @escaping (_ result: RequestResult<[Animal]>)-> Void){
        if let url = URL(string: BaseUrlCats) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            
            urlRequest.addValue("403337ee-e21f-416c-a410-109fc39eb97b", forHTTPHeaderField: "x-api-key")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content_Type")
            
            Alamofire.request(urlRequest).responseJSON { (response) in
                if let result = response.result.value {
                    let json = JSON(result)
                    print("Response:\(json)")
                    var listCats = [Animal]()
                    let cats = json.arrayValue
                    for cat in cats{
                        let data = Animal(withJson: cat)
                        listCats.append(data)
                    }
                    completion(RequestResult.done(listCats))
                }else{
                    completion(RequestResult.failed(message: "Error to load data..."))
                }
            }
        }
    }
}
