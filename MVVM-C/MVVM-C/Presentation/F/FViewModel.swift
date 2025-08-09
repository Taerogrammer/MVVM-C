//
//  FViewModel.swift
//  MVVM-C
//
//  Created by 김태형 on 8/9/25.
//

import Foundation

import RxCocoa
import RxSwift

final class FViewModel {
    private let disposeBag = DisposeBag()

    // Input
    let backButtonTap = PublishSubject<Void>()
    let closeButtonTap = PublishSubject<Void>()

    // Output
    let title = BehaviorRelay<String>(value: "F View Controller (Z Flow)")
    let backButtonTitle = BehaviorRelay<String>(value: "Back to E")
    let closeButtonTitle = BehaviorRelay<String>(value: "Close Z Flow")

    init() {
        setupBindings()
    }

    private func setupBindings() {
        // Additional business logic can be added here
    }
}
