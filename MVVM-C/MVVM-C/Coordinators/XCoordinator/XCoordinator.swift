//
//  XCoordinator.swift
//  MVVM-C
//
//  Created by 김태형 on 8/9/25.
//

import UIKit

final class XCoordinator: Coordinator, XCoordinatorProtocol, BViewControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showAViewController()
    }

    private func showAViewController() {
        let viewModel = AViewModel()
        let viewController = AViewController(viewModel: viewModel)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }

    // MARK: - XCoordinatorProtocol
    func showNextScreenFromA() {
        let viewModel = BViewModel()
        let viewController = BViewController(viewModel: viewModel)
        viewController.delegate = self
        navigationController.pushViewController(viewController, animated: true)
    }

    func showCScreenFromB() {
        let viewModel = CViewModel()
        let viewController = CViewController(viewModel: viewModel)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

    func goBackToA() {
        navigationController.popViewController(animated: true)
    }

    // MARK: XCoordinator에서 이동하는 메서드 (CViewController에서 사용됨)
    func goBackToB() {
        navigationController.popViewController(animated: true)
    }

    // MARK: - BViewControllerDelegate
    func goBackFromB() {
        navigationController.popViewController(animated: true)
    }
}
