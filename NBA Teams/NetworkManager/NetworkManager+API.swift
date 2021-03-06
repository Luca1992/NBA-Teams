//
//  NetworkManager+Teams.swift
//  NBA Teams
//
//  Created by ulixe on 24/04/21.
//

import Foundation

extension NetworkManager {

    func getAllTeams(page: Int = 0, complition: @escaping (Result<[Team]>) -> Void) {
        guard let request = Request(url: Endpoint.getAllTeams.rawValue + "\(page)", method: .get).request else { return } 
        let task = NetworkManager.sessionManager.dataTask(with: request) { [weak self] (data, response, error) in
            if let err = error {
                complition(Result.failure(err))
            } else {
                if let dataJSON = data {
                    do {
                        let obj = try JSONDecoder().decode(TeamsList.self, from: dataJSON)
                        complition(Result.success(obj.list))
                    } catch let err {
                        complition(Result.failure(err))
                    }
                }
            }
        }
        task.resume()
    }

    func getAllPlayersByTeam(page: Int = 1, maxPages: Int? = nil, currentPlayers: [Player] = [], complition: @escaping (Result<[Player]>) -> Void) {
        guard let request = Request(url: Endpoint.getPlayers.rawValue.replacingOccurrences(of: "#", with: "\(page)"), method: .get).request else { return }
        let task = NetworkManager.sessionManager.dataTask(with: request) { [weak self] (data, response, error) in
            if let err = error {
                complition(Result.failure(err))
            } else {
                if let dataJSON = data {
                    do {
                        let obj = try JSONDecoder().decode(PlayersList.self, from: dataJSON)
                        if page == maxPages {
                            complition(Result.success(currentPlayers))
                        } else {
                            var newPlayers = currentPlayers
                            newPlayers.append(contentsOf: obj.list)
                            self?.getAllPlayersByTeam(page: page + 1, maxPages: obj.metadata.totalPages, currentPlayers: newPlayers, complition: complition)
                        }
                    } catch let err {
                        complition(Result.failure(err))
                    }
                }
            }
        }
        task.resume()
    }

    func getPlayer(id: Int, complition: @escaping (Result<Player>) -> Void) {
        guard let request = Request(url: Endpoint.detailPlayer.rawValue + "/\(id)", method: .get).request else { return }
        let task = NetworkManager.sessionManager.dataTask(with: request) { [weak self] (data, response, error) in
            if let err = error {
                complition(Result.failure(err))
            } else {
                if let dataJSON = data {
                    do {
                        let obj = try JSONDecoder().decode(Player.self, from: dataJSON)
                        complition(Result.success(obj))
                    } catch let err {
                        complition(Result.failure(err))
                    }
                }
            }
        }
        task.resume()
    }
}
