//
//  TestGitViewCellTests.swift
//  TestGitTests
//
//  Created by Eduardo Emanuel Freire do Vale Oliveira on 03/06/20.
//  Copyright © 2020 Eduardo Oliveira. All rights reserved.
//

import FBSnapshotTestCase
import Swinject
@testable import TestGit

class TestGitViewControllerTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        self.recordMode = false
    }

    func testViewController() {
        let container = TestGitContainer()
        let vc = TestGitViewController()
        vc.viewModel = container.container.resolve(TestGitViewModelProtocol.self)

        FBSnapshotVerifyView(vc.view)
    }
}
