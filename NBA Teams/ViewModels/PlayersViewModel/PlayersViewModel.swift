//
//  PlayersViewModel.swift
//  NBA Teams
//
//  Created by ulixe on 24/04/21.
//

import Foundation
import Combine

class PlayersViewModel: ObservableObject, ObservableViewModel {

    var useCase: UseCase = UseCase()

    var currentPage: Int = 0

    var team: Team?

    @Published var players: [Player] = []

    func didLoad() {
        if let id = self.team?.id {
            self.useCase.getAllPlayersByTeam(teamID: id) { [weak self] (playersResponse, errorResponse) in
                guard let self = self else { return }
                if let players = playersResponse {
                    self.players = players
                }
            }
        }
    }

    func update() {
        if let id = self.team?.id {
            self.currentPage += 1
            self.useCase.getAllPlayersByTeam(page: self.currentPage, teamID: id) { [weak self] (playersResponse, errorResponse) in
                guard let self = self else { return }
                if let players = playersResponse {
                    let newPlayers = players.filter({ player in
                        return !self.players.contains(where: { $0.id == player.id })
                    })
                    self.players.append(contentsOf: newPlayers)
                }
            }
        }
    }
}
