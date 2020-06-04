//
//  TestGitCoordinator.swift
//  TestGit
//
//  Created by Eduardo Emanuel Freire do Vale Oliveira on 03/06/20.
//  Copyright © 2020 Eduardo Oliveira. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {

    // MARK: Properties

    var navigationController: UINavigationController? { get set }

    // MARK: Initialization

    func start()
}

public class TestGitCoordinator: Coordinator {

    // MARK: Properties
    var navigationController: UINavigationController?
    let testGitContainer = TestGitContainer()
    var viewController: UIViewController?

    // MARK: Initialization

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: Public Methods

    public func start() {
        let testGitVC = TestGitViewController()
        testGitVC.viewModel = testGitContainer.container.resolve(TestGitViewModelProtocol.self)
        navigationController?.pushViewController(testGitVC, animated: false)
        viewController = testGitVC
    }
}
