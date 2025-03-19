//
//  MainCoordinator.swift
//  MVVM-C
//
//  Created by 김태형 on 3/19/25.
//

import UIKit

protocol MainCoordinatorDelegate {
    func didLoggedOut(_ coordinator: MainCoordinator)
}

class MainCoordinator: Coordinator, MainViewControllerDelegate {

    var childCoordinators: [Coordinator] = []
    var delegate: MainCoordinatorDelegate?

    private var navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = MainViewController()
        viewController.view.backgroundColor = .cyan
        viewController.delegate = self
        self.navigationController.viewControllers = [viewController]
    }

    func logout() {
        self.delegate?.didLoggedOut(self)
    }
}
