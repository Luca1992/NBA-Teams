//
//  ObservableViewModel.swift
//  NBA Teams
//
//  Created by ulixe on 24/04/21.
//

import Foundation

protocol ObservableViewModel: class {
    func update()
}

protocol ThreeLabel {
    var upperTitle: String { get }
    var centerTitle: String { get }
    var lowerTitle: String { get }
}
