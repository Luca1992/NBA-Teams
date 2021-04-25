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

    func buildAllTeams() -> BaseViewController? {
        let vc = BaseViewController()
        let viewModel = TeamsViewmodel()
        let view = TeamsView(viewModel: viewModel)
        vc.addSubSwiftUIView(view, to: vc.view)
        return vc
    }

    func buildAllPlayersByTeam(team: Team) -> BaseViewController? {
        let vc = BaseViewController()
        let viewModel = PlayersViewModel()
        viewModel.team = team
        let view = PlayersOfTeamView(viewModel: viewModel)
        vc.addSubSwiftUIView(view, to: vc.view)
        return vc
    }

    func buildPlayerDetail(playerID: Int) -> BaseViewController? {
        let vc = BaseViewController()
        let viewModel = PlayerDetailViewModel()
        viewModel.playerID = playerID
        let view = PlayerDetailView(viewModel: viewModel)
        vc.addSubSwiftUIView(view, to: vc.view)
        return vc
    }
}
