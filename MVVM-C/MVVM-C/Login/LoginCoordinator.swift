//
//  LoginCoordinator.swift
//  MVVM-C
//
//  Created by 김태형 on 3/19/25.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func didLoggedIn(_ coordinator: LoginCoordinator)
}

// 6. LoginCoordinator 구현
// 7-1. LoginViewControllerDelegate 구현
final class LoginCoordinator: Coordinator, LoginViewControllerDelegate {

    var childCoordinators: [Coordinator] = []
    var delegate: LoginCoordinatorDelegate?

    private var navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = LoginViewController()
        viewController.view.backgroundColor = .brown
        viewController.delegate = self

        self.navigationController.viewControllers = [viewController]
    }

    func login() {
        self.delegate?.didLoggedIn(self)
    }
}
