//
//  PlayersViewModel.swift
//  NBA Teams
//
//  Created by ulixe on 24/04/21.
//

import Foundation
import Combine

class PlayersViewModel: ObservableObject {

    var useCase: UseCase = UseCase()

    var currentPage: Int = 0

    var team: Team?

    @Published var players: [Player] = []

    @Published var isLoading: Bool = true

    var playersCount: Int {
        return self.players.count
    }

    func didLoad() {
        if let id = self.team?.id {
            self.useCase.getAllPlayersByTeam(teamID: id) { [weak self] (playersResponse, errorResponse) in
                guard let self = self else { return }
                if let players = playersResponse {
                    DispatchQueue.main.async {
                        self.players = players
                        self.isLoading = false
                    }
                }
            }
        }
    }
}
