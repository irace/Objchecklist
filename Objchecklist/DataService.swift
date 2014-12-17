//
//  DataService.swift
//  Objchecklist
//
//  Created by Bryan Irace on 11/15/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

import Foundation

class DataService {
    class func latestIssues() -> [Issue] {
        if let URL = NSBundle.mainBundle().URLForResource("objcio", withExtension: "json") {
            if let data = NSData(contentsOfURL: URL) {
                return objectsFromData(data, mapper: Issue.fromDictionary)
            }
        }
        
        return []
    }
    
    class func objectsFromData<T>(data: NSData, mapper: ([String: AnyObject] -> T)) -> [T] {
        var error: NSError?
        
        let results = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers,
            error: &error) as [[String: AnyObject]]
        
        if let parseError = error {
            println("Error parsing JSON: \(parseError)")
        }
        
        return results.map(mapper)
    }
}
