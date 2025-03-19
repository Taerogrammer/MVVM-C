//
//  Coordinator.swift
//  MVVM-C
//
//  Created by 김태형 on 3/19/25.
//

import UIKit

// 1. Coordinator 프로토콜을 생성
protocol Coordinator : AnyObject {
    var childCoordinators : [Coordinator] { get set }
    func start()
}

// 2. AppCoordinator 생성
final class AppCoordinator: Coordinator, LoginCoordinatorDelegate, MainCoordinatorDelegate {

    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController!

    var isLoggedIn: Bool = false

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // 3. 로그인 여부
    func start() {
        if isLoggedIn {
            showMainViewController()
        } else {
            showLoginViewController()
        }
    }

    // 5. 각각의 화면에 들어갈 Coordinator 선언
    private func showMainViewController() {
        let coordinator = MainCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }

    private func showLoginViewController() {
        let coordinator = LoginCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }

    func didLoggedIn(_ coordinator: LoginCoordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
        self.showMainViewController()
    }

    func didLoggedOut(_ coordinator: MainCoordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
        self.showLoginViewController()
    }
}
