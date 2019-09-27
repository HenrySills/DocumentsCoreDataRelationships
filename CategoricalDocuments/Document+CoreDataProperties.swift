//
//  Document+CoreDataProperties.swift
//  CategoricalDocuments
//
//  Created by Henry Sills on 9/27/19.
//  Copyright © 2019 Shawn Moore. All rights reserved.
//
//

import Foundation
import CoreData


extension Document {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Document> {
        return NSFetchRequest<Document>(entityName: "Document")
    }

    @NSManaged public var name: String?
    @NSManaged public var text: String?
    @NSManaged public var category: Category?

}
