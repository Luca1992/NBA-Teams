//
//  UseCase.swift
//  NBA Teams
//
//  Created by ulixe on 24/04/21.
//

import Foundation

class UseCase {

    let networkRepository: NetworkManager = NetworkManager()

    func getAllTeams(page: Int = 0, complition: @escaping ([Team]?, Error?) -> Void) {
        networkRepository.getAllTeams(page: page) { (result) in
            switch result {
            case .success(let teams):
                complition(teams, nil)
            case .failure(let err):
                complition(nil, err)
            }
        }
    }

    func getAllPlayersByTeam(page: Int = 0, teamID: Int, complition: @escaping ([Player]?, Error?) -> Void) {
        networkRepository.getAllPlayersByTeam(page: page) { (result) in
            switch result {
            case .success(let players):
                let playersByTeam: [Player] = players.filter({ $0.team.id == teamID })
                complition(playersByTeam, nil)
            case .failure(let err):
                complition(nil, err)
            }
        }
    }

    func getPlayer(id: Int, complition: @escaping (Player?, Error?) -> Void) {
        networkRepository.getPlayer(id: id) { (result) in
            switch result {
            case .success(let player):
                complition(player, nil)
            case .failure(let err):
                complition(nil, err)
            }
        }
    }
}
