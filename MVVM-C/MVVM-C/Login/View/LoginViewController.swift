//
//  LoginViewController.swift
//  MVVM-C
//
//  Created by 김태형 on 3/19/25.
//

import UIKit

// 7. LoginViewControllerDelegate 구현 -> LoginViewController에서 Login 버튼을 누르면 LoginCoordinator가 이를 알아야 하기 때문에 Delegate를 통해 전달
protocol LoginViewControllerDelegate: AnyObject {
    func login()
}

// 6-1. LoginViewController 구현
final class LoginViewController: UIViewController {

    var delegate: LoginViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(self.loginButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
    }

    deinit {
        print("- \(type(of: self)) deinit")
    }

    @objc
    func loginButtonDidTap() {
        self.delegate?.login()
    }
}
