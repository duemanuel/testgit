//
//  TestGitTests.swift
//  TestGitTests
//
//  Created by Eduardo Emanuel Freire do Vale Oliveira on 03/06/20.
//  Copyright © 2020 Eduardo Oliveira. All rights reserved.
//

import Quick
import Nimble
import Swinject
@testable import TestGit

class TestGitTests: QuickSpec {

    var testGitContainer: Container!
    var useCase: TestGitUseCaseProtocol!
    var data: GitModelContent?

    override func spec() {
        describe("Testando UseCase") {
            beforeEach {
                self.testGitContainer = TestGitContainer(mockSetup: true).container
                self.useCase = self.testGitContainer.resolve(TestGitUseCaseProtocol.self)

                self.useCase.fetchGitRepos { (result) in
                    self.data = result
                }
            }

            describe("Dado que os dados foram retornados") {
                context("Quando os dados não são nulos") {
                    it("Então") {
                        expect(self.data).toNot(beNil())
                    }
                }
            }
        }
    }
}
