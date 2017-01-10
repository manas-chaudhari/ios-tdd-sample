//
//  GithubApi.swift
//  ArchitectureSample
//
//  Created by Manas Chaudhari on 12/15/16.
//  Copyright © 2016 Manas Chaudhari. All rights reserved.
//

import UIKit
import Moya

enum GithubApi {
    case events
}

extension GithubApi: TargetType {

    public var baseURL: URL { return URL(string: "https://api.github.com")! }

    public var path: String {
        switch self {
        case .events:
            return "events"
        }
    }

    public var method: Moya.Method { return .get }

    public var parameters: [String : Any]? {
        return ["test": "yoyo"]
    }

    public var task: Task {
        return .request
    }

    public var sampleData: Data {
        switch self {
        case .events:
            return "[{\"id\": \"1\", \"type\": \"WatchEvent\"}, {\"id\": \"2\", \"type\": \"PushEvent\"}]".utf8Encoded
        }
    }

}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
}
