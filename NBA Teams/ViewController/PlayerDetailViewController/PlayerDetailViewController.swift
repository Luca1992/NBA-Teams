//
//  PlayerDetailViewController.swift
//  NBA Teams
//
//  Created by ulixe on 25/04/21.
//

import Foundation
import UIKit
import Combine

class PlayerDetailViewController: BaseViewController {
    
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var surnameLabel: UILabel!

    @IBOutlet weak var teamLabel: UILabel!

    @IBOutlet weak var positionLabel: UILabel!

    @IBOutlet weak var heightFeetLabel: UILabel!

    @IBOutlet weak var heightInchesLabel: UILabel!

    @IBOutlet weak var weightPoundsLabel: UILabel!

    var viewModel: PlayerDetailViewModel?

    var subscriptions: Set<AnyCancellable> = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.didLoad()
        self.setListener()
    }

    override func setListener() {
        self.viewModel?.$detail
            .share()
            .sink(receiveValue: { [weak self] (detail) in
                guard let self = self else { return }
                if let detail = detail {
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else { return }
                        self.nameLabel.text = "Name: " + detail.firstName
                        self.surnameLabel.text = "Surname: " + detail.lastName
                        self.teamLabel.text = "Team: " + detail.team.fullName
                        if !detail.position.isEmpty {
                            self.positionLabel.text = "Position: " + detail.position
                        }
                        if let heightFeet = detail.heightFeet {
                            self.heightFeetLabel.text = "Height feet: " + "\(heightFeet)"
                        }
                        if let heightInches = detail.heightInches {
                            self.heightFeetLabel.text = "Height inches: " + "\(heightInches)"
                        }
                        if let weightPounds = detail.weightPounds {
                            self.weightPoundsLabel.text = "Weight pounds: " + "\(weightPounds)"
                        }
                    }
                }
            })
            .store(in: &subscriptions)
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        Navigator.instance.popToNVC()
    }
}
