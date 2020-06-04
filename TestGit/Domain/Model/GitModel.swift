//
//  GitModel.swift
//  TestGit
//
//  Created by Eduardo Emanuel Freire do Vale Oliveira on 03/06/20.
//  Copyright © 2020 Eduardo Oliveira. All rights reserved.
//

import Foundation

struct GitModelContent: Codable {
    let items: [GitModelObj]?
}

struct GitModelObj: Codable {
    let name: String?
    let owner: GitOwner?
    let stargazers_count: Int?
}

struct GitOwner: Codable {
    let login: String?
    let avatar_url: String?
}
