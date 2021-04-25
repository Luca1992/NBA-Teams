//
//  TeamsViewController.swift
//  NBA Teams
//
//  Created by ulixe on 24/04/21.
//

import Foundation
import UIKit
import Combine

class TeamsViewController: BaseViewController {

    @IBOutlet weak var tableList: UITableView!

    var viewModel: TeamsViewmodel?

    var subscriptions: Set<AnyCancellable> = Set<AnyCancellable>()

    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.didLoad()
        refreshControl.addTarget(self, action: #selector(refeshList), for: .valueChanged)
        tableList.refreshControl = refreshControl
        tableList.delegate = self
        tableList.dataSource = self
        tableList.register(UINib(nibName: "ThreeLabelCell", bundle: nil), forCellReuseIdentifier: "ThreeLabelCellID")
    }

    override func setListener() {
        viewModel?.$teams.share().sink(receiveValue: { [weak self] (teams) in
            guard let self = self else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.refreshControl.endRefreshing()
                if !teams.isEmpty {
                    self.tableList.reloadData()
                }
            }
        })
        .store(in: &subscriptions)
    }

    @objc func refeshList() {
        viewModel?.update()
    }
}

extension TeamsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let team = self.viewModel?.teams[indexPath.row] {
            Navigator.instance.pushAllPlayersByTeam(team: team)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.teams.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ThreeLabelCell = tableView.dequeueReusableCell(withIdentifier: "ThreeLabelCellID") as? ThreeLabelCell else {
            return UITableViewCell()
        }

        if let item = viewModel?.teams[indexPath.row] {
            cell.populate(obj: item)
        }
        return cell
    }
}
