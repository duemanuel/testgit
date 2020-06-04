//
//  TestGitContainer.swift
//  TestGit
//
//  Created by Eduardo Emanuel Freire do Vale Oliveira on 03/06/20.
//  Copyright © 2020 Eduardo Oliveira. All rights reserved.
//

import Foundation
import Swinject

public class TestGitContainer {

    // MARK: Public Parameters

    public let container = Container()

    // MARK: Initializer

    public init() {
        setup()
    }

    public init(mockSetup: Bool) {
        if mockSetup {
            self.mockSetup()
        }
    }

    // MARK: Public Methods

    public func setup() {

        // MARK: Service

        container.register(TestGitServiceProtocol.self) { _ in TestGitService() }

        // MARK: UseCase

        container.register(TestGitUseCaseProtocol.self) { resolver in
            let service = resolver.resolve(TestGitServiceProtocol.self)!

            return TestGitUseCase(testGitService: service)
        }

        // MARK: ViewModel

        container.register(TestGitViewModelProtocol.self) { resolver in
            let useCase = resolver.resolve(TestGitUseCaseProtocol.self)!

            return TestGitViewModel(useCase: useCase)
        }
    }

    public func mockSetup() {

        // MARK: Service

        container.register(TestGitServiceProtocol.self) { _ in TestGitServiceMock() }

        // MARK: UseCase

        container.register(TestGitUseCaseProtocol.self) { resolver in
            let service = resolver.resolve(TestGitServiceProtocol.self)!

            return TestGitUseCase(testGitService: service)
        }

        // MARK: ViewModel

        container.register(TestGitViewModelProtocol.self) { resolver in
            let useCase = resolver.resolve(TestGitUseCaseProtocol.self)!

            return TestGitViewModel(useCase: useCase)
        }
    }
}
