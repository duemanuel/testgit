//
//  TestGitViewController.swift
//  TestGit
//
//  Created by Eduardo Emanuel Freire do Vale Oliveira on 03/06/20.
//  Copyright © 2020 Eduardo Oliveira. All rights reserved.
//

import UIKit

class TestGitViewController: UIViewController {

    // MARK: Properties

    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var repoData: GitModelContent?
    var viewModel: TestGitViewModelProtocol?
    var refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide

        getRepos()

        refreshControl.attributedTitle = NSAttributedString(string: "Puxe para atualizar")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)

        setupTableView()
    }

    // MARK: Private Methods

    private func setupTableView() {
        tableView.register(cellType: TestGitViewCell.self, bundle: Bundle.localBundle)

        view.addSubview(tableView)

        tableView.dataSource = self

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        tableView.addSubview(refreshControl)
    }

    @objc func refresh(_ sender: AnyObject) {
        getRepos()
    }

    private func getRepos(){
        viewModel?.getGitRepos() { result in
            self.repoData = result
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
}

// MARK: Extensions

extension TestGitViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let data = repoData?.items else { return 0 }
    return data.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "TestGitViewCell", for: indexPath) as? TestGitViewCell else {
        return UITableViewCell()
    }
    guard let result = self.repoData?.items?[indexPath.row] else { return UITableViewCell() }
    let model = TestGitViewCellModel(imageOwner: (result.owner?.avatar_url)!, namwOwner: (result.owner?.login)!, nameRepo: result.name!, repoRating: String(result.stargazers_count!))
    cell.setup(model: model)
    return cell
  }
}
