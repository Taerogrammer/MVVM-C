//
//  ZCoordinator.swift
//  MVVM-C
//
//  Created by 김태형 on 8/9/25.
//

import UIKit

final class ZCoordinator: Coordinator, ZCoordinatorProtocol {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: XCoordinator?   // 부모 Coordinator 참조

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showEViewController()
    }

    private func showEViewController() {
        let viewModel = EViewModel()
        let viewController = EViewController(viewModel: viewModel)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }

    func showFScreenFromE() {
        let viewModel = FViewModel()
        let viewController = FViewController(viewModel: viewModel)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

    func goBackToE() {
        navigationController.popViewController(animated: true)
    }

    func dismissZFlow() {
        navigationController.dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.parentCoordinator?.childDidFinish(self)
        }
    }
}
