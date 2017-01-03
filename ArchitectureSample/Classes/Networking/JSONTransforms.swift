//
//  JSONTransforms.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 12/16/16.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import UIKit
import ObjectMapper

struct JSONTransforms {

    static let stringToInt = TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } })

}
