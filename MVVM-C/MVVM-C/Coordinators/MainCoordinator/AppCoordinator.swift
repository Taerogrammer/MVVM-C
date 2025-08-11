//
//  MainCoordinator.swift
//  MVVM-C
//
//  Created by 김태형 on 8/9/25.
//

import UIKit

final class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }

    func start() {
        showTabBarController()
    }

    private func showTabBarController() {
        let tabBarController = UITabBarController()

        // X Coordinator (First Tab)
        let xNavController = UINavigationController()
        let xCoordinator = XCoordinator(navigationController: xNavController)
        xCoordinator.start()
        childCoordinators.append(xCoordinator)

        xNavController.tabBarItem = UITabBarItem(
            title: "First",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )

        // Y Coordinator (Second Tab)
        let yNavController = UINavigationController()
        let yCoordinator = YCoordinator(navigationController: yNavController)
        yCoordinator.start()
        childCoordinators.append(yCoordinator)

        yNavController.tabBarItem = UITabBarItem(
            title: "Second",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )

        tabBarController.viewControllers = [xNavController, yNavController]
        navigationController.pushViewController(tabBarController, animated: true)
    }
}
