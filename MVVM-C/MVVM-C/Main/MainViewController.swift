//
//  MainViewController.swift
//  MVVM-C
//
//  Created by 김태형 on 3/19/25.
//

import UIKit

protocol MainViewControllerDelegate {
    func logout()
}

class MainViewController: UIViewController {

    var delegate: MainViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(logoutButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
        // Do any additional setup after loading the view.
    }

    deinit {
        print("- \(type(of: self)) deinit")
    }

    @objc
    func logoutButtonDidTap() {
        self.delegate?.logout()
    }
}
