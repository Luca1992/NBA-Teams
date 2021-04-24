//
//  TeamsViewModel.swift
//  NBA Teams
//
//  Created by ulixe on 24/04/21.
//

import Foundation
import Combine

class TeamsViewmodel: ObservableObject, ObservableViewModel {

    var useCase: UseCase = UseCase()

    var currentPage: Int = 0

    @Published var teams: [Team] = []

    func didLoad() {
        self.useCase.getAllTeams { [weak self] (responseTeams, responseErr) in
            guard let self = self else { return }
            if let teams = responseTeams {
                self.currentPage += 1
                self.teams = teams
            }
        }
    }

    func update() {
        self.currentPage += 1
        self.useCase.getAllTeams(page: self.currentPage) { [weak self] (responseTeams, responseErr) in
            guard let self = self else { return }
            if let teams = responseTeams {
                self.teams.append(contentsOf: teams)
            }
        }
    }
}
