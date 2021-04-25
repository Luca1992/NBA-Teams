//
//  VCBuilder.swift
//  NBA Teams
//
//  Created by ulixe on 24/04/21.
//

import Foundation
import UIKit

class VCBuilder {

    static let instance = VCBuilder()

    func buildAllTeams() -> TeamsViewController? {
        let sb = UIStoryboard(name: "TeamsViewController", bundle: nil)
        guard let vc = sb.instantiateInitialViewController() as? TeamsViewController else {
            return nil
        }
        let viewModel = TeamsViewmodel()
        vc.viewModel = viewModel
        return vc
    }

    func buildAllPlayersByTeam(team: Team) -> PlayersViewController? {
        let sb = UIStoryboard(name: "PlayersViewController", bundle: nil)
        guard let vc = sb.instantiateInitialViewController() as? PlayersViewController else {
            return nil
        }
        let viewModel = PlayersViewModel()
        viewModel.team = team
        vc.viewModel = viewModel
        return vc
    }

    func buildPlayerDetail(playerID: Int) -> PlayerDetailViewController? {
        let sb = UIStoryboard(name: "PlayerDetailViewController", bundle: nil)
        guard let vc = sb.instantiateInitialViewController() as? PlayerDetailViewController else {
            return nil
        }
        let viewModel = PlayerDetailViewModel()
        viewModel.playerID = playerID
        vc.viewModel = viewModel
        return vc
    }
}
