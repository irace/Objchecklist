//
//  DataService.swift
//  Objchecklist
//
//  Created by Bryan Irace on 11/15/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

import Foundation

class DataService: NSObject {
    class func latestData() -> Array<Issue> {
        if let URL = NSBundle.mainBundle().URLForResource("objcio", withExtension: "json") {
            if let data = NSData(contentsOfURL: URL) {
                var error: NSError?
                
                let results = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers,
                    error: &error) as Array<Dictionary<String, AnyObject>>
                
                if let parseError = error {
                    println("Error parsing JSON: \(parseError)")
                }
                else {
                    return results.map(Issue.fromDictionary)
                }
            }
        }
        
        return []
    }
}
