//
//  XCoordinatorProtocol.swift
//  MVVM-C
//
//  Created by 김태형 on 8/9/25.
//

import Foundation

protocol XCoordinatorProtocol: AnyObject {
    func showNextScreenFromA()
    func showCScreenFromB()
    func showEScreenFromC()
    func goBackToA()
    func goBackToB()
}
