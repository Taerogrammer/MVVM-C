//
//  YCoordinator.swift
//  MVVM-C
//
//  Created by 김태형 on 8/9/25.
//

import UIKit

final class YCoordinator: Coordinator, YCoordinatorProtocol, BViewControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showDViewController()
    }

    private func showDViewController() {
        let viewModel = DViewModel()
        let viewController = DViewController(viewModel: viewModel)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }

    // MARK: - YCoordinatorProtocol
    func showNextScreenFromD() {
        let viewModel = BViewModel()
        let viewController = BViewController(viewModel: viewModel)
        viewController.delegate = self
        navigationController.pushViewController(viewController, animated: true)
    }

    func goBackToD() {
        navigationController.popViewController(animated: true)
    }

    // MARK: - BViewControllerDelegate
    func showCScreenFromB() {
        // D → B 흐름에서는 C 화면으로 갈 수 없으므로 아무 동작 안함
        // 근데 애초에 흐름을 정의하는 것이기 때문에 굳이 이렇게 정의할 필요는 없을 수 있음
        print("C screen is not available from D → B flow")
    }

    func goBackFromB() {
        navigationController.popViewController(animated: true)
    }
}
