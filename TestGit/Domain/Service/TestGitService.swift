//
//  TestGitService.swift
//  TestGit
//
//  Created by Eduardo Emanuel Freire do Vale Oliveira on 03/06/20.
//  Copyright © 2020 Eduardo Oliveira. All rights reserved.
//

import Alamofire

protocol TestGitServiceProtocol {
    func fetchGitRepos(completion: @escaping (GitModelContent?) -> Void)
}

class TestGitService: TestGitServiceProtocol {

    // MARK: Properties

    private let urlBase = "https://api.github.com/search/repositories?q=language:swift&sort=stars"

    // MARK: Public Methods

    func fetchGitRepos(completion: @escaping (GitModelContent?) -> Void) {

        Alamofire.request(urlBase).responseJSON { response in
            guard let result = response.data else {
                completion(nil)
                return
            }
            do{
                let repos = try JSONDecoder().decode(GitModelContent?.self, from: result)!
                completion(repos)
            }catch{
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
