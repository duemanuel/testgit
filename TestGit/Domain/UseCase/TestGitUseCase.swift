//
//  TestGitUseCase.swift
//  TestGit
//
//  Created by Eduardo Emanuel Freire do Vale Oliveira on 03/06/20.
//  Copyright © 2020 Eduardo Oliveira. All rights reserved.
//

import Foundation

protocol TestGitUseCaseProtocol {
    func fetchGitRepos(completion: @escaping (GitModelContent?) -> Void)
}

class TestGitUseCase: TestGitUseCaseProtocol {

    // MARK: Properties

    var testGitService: TestGitServiceProtocol?

    // MARK: Initializer

    init(testGitService: TestGitServiceProtocol) {
        self.testGitService = testGitService
    }

    // MARK: Public Methods

    func fetchGitRepos(completion: @escaping (GitModelContent?) -> Void) {
        testGitService?.fetchGitRepos() { result in
            completion(result)
        }
    }
}
