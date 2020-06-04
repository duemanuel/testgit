//
//  TestGitModule.swift
//  TestGit
//
//  Created by Eduardo Emanuel Freire do Vale Oliveira on 03/06/20.
//  Copyright © 2020 Eduardo Oliveira. All rights reserved.
//

import UIKit

private class TestGitSetupHelper {
    var coordinator: TestGitCoordinator?
}

public class TestGitModule {

    // MARK: Properties

    static let instance = TestGitModule()
    private static let setup = TestGitSetupHelper()

    // MARK: Public Methods

    public static func startTestGit(navigationController: UINavigationController?) {
        if let navController = navigationController {
            TestGitModule.setup.coordinator = TestGitCoordinator(navigationController: navController)
            TestGitModule.setup.coordinator?.start()
        }
    }
}
