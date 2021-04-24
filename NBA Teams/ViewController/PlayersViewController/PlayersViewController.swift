//
//  PlayersViewController.swift
//  NBA Teams
//
//  Created by ulixe on 24/04/21.
//

import Foundation
import UIKit
import Combine

class PlayersViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var tableList: UITableView!

    var viewModel: PlayersViewModel?

    var subscriptions: Set<AnyCancellable> = Set<AnyCancellable>()

    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = viewModel?.team?.fullName
        viewModel?.didLoad()
        refreshControl.addTarget(self, action: #selector(refeshList), for: .valueChanged)
        tableList.refreshControl = refreshControl
        tableList.delegate = self
        tableList.dataSource = self
        tableList.register(UINib(nibName: "ThreeLabelCell", bundle: nil), forCellReuseIdentifier: "ThreeLabelCellID")
        setListener()
    }

    override func setListener() {
        viewModel?.$players.share().sink(receiveValue: { [weak self] (players) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                if !players.isEmpty {
                    self.tableList.reloadData()
                }
            }
        })
        .store(in: &subscriptions)
    }

    @objc func refeshList() {
        viewModel?.update()
    }

    @IBAction func backPressed(_ sender: UIButton) {
        Navigator.instance.popToNVC()
    }
}

extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.players.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ThreeLabelCell = tableView.dequeueReusableCell(withIdentifier: "ThreeLabelCellID") as? ThreeLabelCell else {
            return UITableViewCell()
        }

        if let item = viewModel?.players[indexPath.row] {
            cell.populate(obj: item)
        }
        return cell
    }
}
