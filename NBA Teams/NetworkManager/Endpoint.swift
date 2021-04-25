//
//  Endpoint.swift
//  NBA Teams
//
//  Created by ulixe on 24/04/21.
//

import Foundation

enum Endpoint: String {
    case getAllTeams = "/teams?page="
    case getPlayers = "/players?page=#&per_page=200"
    case detailPlayer = "/players"
}
