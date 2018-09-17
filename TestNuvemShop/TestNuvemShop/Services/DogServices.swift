//
//  DogServices.swift
//  TestNuvemShop
//
//  Created by Antonio Queiroz on 13/09/2018.
//  Copyright © 2018 Antonio Queiroz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class DogServices{
    var BaseUrlDogs : String = "https://api.thedogapi.com/v1/images/search/?limit=50"
    
    func getDogs(completion: @escaping (_ result: RequestResult<[Animal]>)-> Void){
        if let url = URL(string: BaseUrlDogs) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            
            urlRequest.addValue("438263ad-21e0-4db0-93e6-b066593dbc16", forHTTPHeaderField: "x-api-key")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content_Type")
            
            Alamofire.request(urlRequest).responseJSON { (response) in
                if let result = response.result.value {
                    let json = JSON(result)
                    print("Response:\(json)")
                    var listDogs = [Animal]()
                    let dogs = json.arrayValue
                    for dog in dogs{
                        let data = Animal(withJson: dog)
                        listDogs.append(data)
                    }
                    completion(RequestResult.done(listDogs))
                }else{
                    completion(RequestResult.failed(message: "Error to load data..."))
                }
            }
        }
    }
}
