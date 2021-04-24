//
//  Navgator.swift
//  NBA Teams
//
//  Created by ulixe on 24/04/21.
//

import Foundation
import UIKit

class Navigator {

    static let instance = Navigator()

    var nvc = UINavigationController()

    func boot(window: UIWindow) {
        self.nvc.isNavigationBarHidden = true
        window.rootViewController = self.nvc
        window.makeKeyAndVisible()
    }

    func popToNVC() {
        nvc.popViewController()
    }

    func pushAllTeams(){
        if let vc = VCBuilder.instance.buildAllTeams() {
            nvc.pushViewController(vc, animated: false)
        }
    }

    func pushAllPlayersByTeam(team: Team){
        if let vc = VCBuilder.instance.buildAllPlayersByTeam(team: team) {
            nvc.pushViewController(vc, animated: false)
        }
    }
}

extension UINavigationController {

    func pushViewController(_ viewController: UIViewController) {
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        view.layer.add(transition, forKey: nil)
        pushViewController(viewController, animated: false)
    }

    func popViewController() {
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        view.layer.add(transition, forKey: nil)
        popViewController(animated: false)
    }

    func popToRoot() {
        CATransaction.begin()
        self.popToRootViewController(animated: false)
        CATransaction.commit()
    }
}
