//
//  ConfigApps.swift
//  viper-unit-testing
//
//  Created by Ganang Arief Pratama on 03/09/20.
//  Copyright © 2020 ganang.id. All rights reserved.
//

import Foundation

struct ConfigApps {
    private static func getConfig() -> Dictionary<String, Any>? {
        var myDict: Dictionary<String, Any>?
        
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path) as? [String : Any] {
            myDict = dict
        }
        
        /*
         Get the url of path config
         */
        if let url = Bundle.main.url(forResource: "Config", withExtension: "plist") {
            let d = NSDictionary(contentsOf: url)
            debugPrint("URL: \(url)")
            debugPrint(d ?? "")
        } else {
            debugPrint("No URL")
        }
        
        if let fileUrl = Bundle.main.url(forResource: "Config", withExtension: "plist"), let data = try? Data(contentsOf: fileUrl) {
            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [[String : Any]] {
                print("result: \(result)")
            }
        }
        
        return myDict
    }
    
    public static func getUrlVideo() -> String {
        if let config = getConfig() {
            return config["baseUrlVideo"] as! String
        }
        return ""
    }
    
}
