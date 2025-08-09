//
//  BViewModel.swift
//  MVVM-C
//
//  Created by 김태형 on 8/9/25.
//

import RxCocoa
import RxSwift

final class BViewModel {
    private let disposeBag = DisposeBag()

    // Input
    let nextButtonTap = PublishSubject<Void>()
    let backButtonTap = PublishSubject<Void>()

    // Output
    let title = BehaviorRelay<String>(value: "B View Controller")
    let nextButtonTitle = BehaviorRelay<String>(value: "Go to C Screen")
    let backButtonTitle = BehaviorRelay<String>(value: "Go Back")

    init() {
        setupBindings()
    }

    private func setupBindings() {
        // Additional business logic can be added here
    }
}
