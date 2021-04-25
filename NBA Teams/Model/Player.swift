//
//  Player.swift
//  NBA Teams
//
//  Created by ulixe on 24/04/21.
//

import Foundation

struct PlayersList: Codable {

    var list: [Player]

    var metadata: Metadata

    enum Keys: String, CodingKey {
        case list = "data"
        case metadata = "meta"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Keys.self)
        self.list = try! values.decode([FailableDecodable<Player>].self, forKey: .list).compactMap { $0.base }
        self.metadata = try values.decode(Metadata.self, forKey: .metadata)
    }
}

struct Player: Codable, Identifiable, ThreeLabel {

    var id: Int
    var firstName: String
    var lastName: String
    var position: String
    var team: Team
    var heightFeet: Int?
    var heightInches: Int?
    var weightPounds: Int?

    enum Keys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case position
        case team
        case heightFeet = "height_feet"
        case heightInches = "height_inches"
        case weightPounds = "weight_pounds"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Keys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.firstName = try values.decode(String.self, forKey: .firstName)
        self.lastName = try values.decode(String.self, forKey: .lastName)
        self.position = try values.decode(String.self, forKey: .position)
        self.team = try values.decode(Team.self, forKey: .team)
        self.heightFeet = try? values.decode(Int.self, forKey: .heightFeet)
        self.heightInches = try? values.decode(Int.self, forKey: .heightInches)
        self.weightPounds = try? values.decode(Int.self, forKey: .weightPounds)
    }

    var upperTitle: String {
        return ""
    }

    var centerTitle: String {
        return self.firstName + " " + self.lastName
    }

    var lowerTitle: String {
        return self.team.fullName
    }
}
