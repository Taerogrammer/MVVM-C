//
//  Coordinator.swift
//  MVVM-C
//
//  Created by 김태형 on 8/9/25.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
