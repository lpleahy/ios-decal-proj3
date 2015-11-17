//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var url : String!
    /* The username of the photographer. */
    var username : String!
    
    var date: NSDate!
    
    var size: CGSize!

    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        // FILL ME IN
        // HINT: use nested .valueForKey() calls, and then cast using 'as! TYPE'
        likes = data["likes"]!["count"] as! Int!
    
        // Video or photo?
        let mediaType: String! = data["type"] as! String
        if mediaType == "image" {
            url = data.valueForKeyPath("images.standard_resolution.url") as! String
        } else {
            url = data.valueForKeyPath("videos.standard_resolution.url") as! String
        }
        
        username = data["user"]!["username"] as! String
        
        let width = data.valueForKeyPath("images.standard_resolution.width") as! Int
        let height = data.valueForKeyPath("images.standard_resolution.height") as! Int

        size = CGSize(width: width, height: height)
        
        let str  = data.valueForKeyPath("created_time") as! String
        date = NSDate(timeIntervalSince1970: NSTimeInterval(NSNumber(double: Double(str)!)))
        
    }

}