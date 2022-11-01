//
//  Coordinator.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 31/10/22.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    var navigationController: UINavigationController { get }

    func start()
}
