//
//  TestGitViewCell.swift
//  TestGit
//
//  Created by Eduardo Emanuel Freire do Vale Oliveira on 03/06/20.
//  Copyright © 2020 Eduardo Oliveira. All rights reserved.
//

import UIKit
import Kingfisher

struct TestGitViewCellModel {
    var imageOwner: String
    var namwOwner: String
    var nameRepo: String
    var repoRating: String
}

class TestGitViewCell: UITableViewCell {

    @IBOutlet private weak var imageOwner: UIImageView!
    @IBOutlet private weak var nameOwner: UILabel!
    @IBOutlet private weak var nameRepo: UILabel!
    @IBOutlet private weak var repoRating: UILabel!

    func setup(model: TestGitViewCellModel){
        imageOwner.kf.setImage(with: URL(string:model.imageOwner))
        nameOwner.text = "Autor: \(model.namwOwner)"
        nameRepo.text = "Repositório: \(model.nameRepo)"
        repoRating.text = "Clasificação: \(model.repoRating)"
    }
}
