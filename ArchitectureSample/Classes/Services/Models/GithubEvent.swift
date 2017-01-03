//
//  GithubEvent.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 12/27/16.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import UIKit
import ObjectMapper

struct GithubEvent: Equatable {
    var id: Int!
    var type: String!
    
    public static func == (lhs: GithubEvent, rhs: GithubEvent) -> Bool {
        return lhs.id == rhs.id &&
            lhs.type == rhs.type
    }
}

extension GithubEvent: Mappable {
    /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point
    public init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- (map["id"], JSONTransforms.stringToInt)
        type <- map["type"]
    }
    
}
