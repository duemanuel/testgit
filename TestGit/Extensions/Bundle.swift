//
//  Bundle.swift
//  TestGit
//
//  Created by Eduardo Emanuel Freire do Vale Oliveira on 03/06/20.
//  Copyright © 2020 Eduardo Oliveira. All rights reserved.
//

import Foundation

extension Bundle {
    static var localBundle: Bundle {
        return Bundle(for: TestGitModule.self)
    }
}
