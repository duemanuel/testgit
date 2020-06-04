//
//  TestGitViewModel.swift
//  TestGit
//
//  Created by Eduardo Emanuel Freire do Vale Oliveira on 03/06/20.
//  Copyright © 2020 Eduardo Oliveira. All rights reserved.
//

import Foundation

protocol TestGitViewModelProtocol {
    func getGitRepos(completion: @escaping (GitModelContent?) -> Void)
}

class TestGitViewModel: TestGitViewModelProtocol {

    // MARK: Properties

    var useCase: TestGitUseCaseProtocol?

    // MARK: Initializar

    init(useCase: TestGitUseCaseProtocol) {
        self.useCase = useCase
    }

    // MARK: Public Methods

    func getGitRepos(completion: @escaping (GitModelContent?) -> Void) {
        useCase?.fetchGitRepos() { result in
            completion(result)
        }
    }
}
