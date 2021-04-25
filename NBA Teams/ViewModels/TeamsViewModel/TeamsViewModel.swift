//
//  TeamsViewModel.swift
//  NBA Teams
//
//  Created by ulixe on 24/04/21.
//

import Foundation
import Combine

class TeamsViewmodel: ObservableObject {

    var useCase: UseCase = UseCase()

    var currentPage: Int = 0

    @Published var teams: [Team] = []

    var teamsCount: Int {
        return self.teams.count
    }

    func didLoad() {
        self.useCase.getAllTeams { [weak self] (responseTeams, responseErr) in
            guard let self = self else { return }
            if let teams = responseTeams {
                DispatchQueue.main.async {
                    self.currentPage += 1
                    self.teams = teams
                }
            }
        }
    }
}
