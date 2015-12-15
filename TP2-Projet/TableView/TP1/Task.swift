//
//  Task.swift
//  TP1
//
//  Created by user on 23.11.15.
//  Copyright © 2015 user. All rights reserved.
//

import UIKit

class Task : NSObject, NSCoding{
    
    //MARK: Properties
    
    var name : String
    var image : UIImage?
    
    //MARK: Archiving paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("tasks")
    
    //MARK: Types
    struct PropertyKey{
        static let nameKey = "name"
        static let imageKey = "image"
    }
    
    //MARK: Initialization
    
    init?(name: String, image: UIImage?) {
        // Initialize stored properties.
        self.name = name
        self.image = image
        
        super.init()
        
        // Initialization should fail if there is no name.
        if name.isEmpty{
            return nil
        }
    }
    
    //MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(image, forKey: PropertyKey.imageKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        // Because photo is an optional property of Meal, use conditional cast.
        let image = aDecoder.decodeObjectForKey(PropertyKey.imageKey) as? UIImage
        
        // Must call designated initilizer.
        self.init(name: name, image: image)
    }
}

