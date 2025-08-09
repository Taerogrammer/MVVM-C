//
//  BViewControllerDelegate.swift
//  MVVM-C
//
//  Created by 김태형 on 8/9/25.
//

import Foundation

protocol BViewControllerDelegate: AnyObject {
    func showCScreenFromB()
    func goBackFromB()
}
