//
//  ApiResponse.swift
//  TestNuvemShop
//
//  Created by Antonio Queiroz on 11/09/2018.
//  Copyright © 2018 Antonio Queiroz. All rights reserved.
//

import Foundation
import SwiftyJSON


public enum RequestResult<T>{
    case done(T)
    case failed(message: String)
}

public enum RequestProgressResult<T>{
    case done(T)
    case emailNeeded()
    case failed(message: String)
    case onProgress(progress: Double)
}

class APIError {
    var message: String = ""
    typealias BuilderClosure = (APIError) -> ()
    init(buildError: BuilderClosure) {
        buildError(self)
    }
    
}

struct ApiErrorResponse {
    static func processAPIFailed(data: Any) -> APIError {
        let dataJSON = JSON(data)
        let errorMessage = dataJSON["error"]["message"].stringValue
        let error = dataJSON["error"].stringValue
        let message = (errorMessage.isEmpty) ? error : errorMessage
        let result = APIError { api in
            api.message = (message.isEmpty) ? "Cannot process your request. Please try again later." : message
        }
        
        return result
    }
    
}
