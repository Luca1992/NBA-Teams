//
//  PlayerDetailViewModel.swift
//  NBA Teams
//
//  Created by ulixe on 25/04/21.
//

import Foundation
import Combine

class PlayerDetailViewModel: ObservableObject {

    var useCase: UseCase = UseCase()

    @Published var detail: Player?

    var playerID: Int = 0

    func didLoad() {
        self.useCase.getPlayer(id: self.playerID) { [weak self] (detail, error) in
            guard let self = self else { return }
            if let detail = detail {
                DispatchQueue.main.async { [weak self] in
                    self?.detail = detail
                }
            }
        }
    }
}
