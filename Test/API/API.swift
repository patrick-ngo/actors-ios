//
//  API.swift
//  Test
//
//  Created by Netccentric on 29/3/17.
//  Copyright © 2017 ngo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API: NSObject
{
    static let API_KEY = "e4a3bc287b929e12897dd730b1b153e9"
    static let BASE_URL_IMAGES_LOW = "https://image.tmdb.org/t/p/w185"
    static let BASE_URL_IMAGES_HIGH = "https://image.tmdb.org/t/p/w500"
    
    fileprivate class func baseUrl() -> String
    {
        return  "https://api.themoviedb.org/3/"
    }
    
    class func callMethod(method: String, parameters: [String:Any], completionHandler:@escaping (AnyObject?)->())
    {
        DispatchQueue.global(qos: .default).async
        {
            var params = parameters
            
            //always add api key
            params["api_key"] = API_KEY

            //network request on background thread
            Alamofire.request( baseUrl() + method, method: .get, parameters: params).responseJSON
            {   response in
                
                if let jsonData = response.result.value
                {
                    DispatchQueue.main.async
                    {
                        
                        completionHandler(jsonData as AnyObject?)
                    }
                }
                else if response.result.error != nil
                {
                    DispatchQueue.main.async
                    {
                        //TODO: handle error here
                        
                        //completionhandler on main thread
                        completionHandler(nil)
                    }
                }
            }
        }
    }
    

}
