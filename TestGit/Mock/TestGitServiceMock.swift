//
//  TestGitServiceMock.swift
//  TestGit
//
//  Created by Eduardo Emanuel Freire do Vale Oliveira on 03/06/20.
//  Copyright © 2020 Eduardo Oliveira. All rights reserved.
//

import Foundation

class TestGitServiceMock: TestGitServiceProtocol {
    func fetchGitRepos(completion: @escaping (GitModelContent?) -> Void) {
        let owner = GitOwner(login: "Eduardo Oliveira", avatar_url: "https://avatars1.githubusercontent.com/u/3006190?v=4")
        let item = GitModelObj(name: "Test Git", owner: owner, stargazers_count: 123455)
        let gitModelContent = GitModelContent(items: [item])

        completion(gitModelContent)
    }

    public init() { }
}
