//
//  CatServices.swift
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
    
    func getCats(completion: @escaping (_ result: RequestResult<[Cat]>)-> Void){
        if let url = URL(string: BaseUrlCats) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            
            urlRequest.addValue("403337ee-e21f-416c-a410-109fc39eb97b", forHTTPHeaderField: "x-api-key")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content_Type")
            
            Alamofire.request(urlRequest).responseJSON { (response) in
                if let result = response.result.value {
                    let json = JSON(result)
                    print("jsonnya:\(json)")
                    var listCats = [Cat]()
                    let cats = json.arrayValue
                    for cat in cats{
                        let data = Cat(withJson: cat)
                        listCats.append(data)
                    }
                    completion(RequestResult.done(listCats))
                }else{
                    completion(RequestResult.failed(message: "Erro ao buscar dados..."))
                }
            }
        }
    }
}
