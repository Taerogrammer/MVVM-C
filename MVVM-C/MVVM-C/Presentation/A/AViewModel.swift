//
//  AViewModel.swift
//  MVVM-C
//
//  Created by 김태형 on 8/9/25.
//

import RxCocoa
import RxSwift

final class AViewModel {
    private let disposeBag = DisposeBag()

    // Input
    let nextButtonTap = PublishSubject<Void>()

    // Output
    let title = BehaviorRelay<String>(value: "A View Controller")
    let buttonTitle = BehaviorRelay<String>(value: "Go to Next Screen")

    init() {
        setupBindings()
    }

    private func setupBindings() {
        // Additional business logic can be added here
    }
}
