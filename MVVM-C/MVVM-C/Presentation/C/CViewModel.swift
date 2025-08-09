//
//  CViewModel.swift
//  MVVM-C
//
//  Created by 김태형 on 8/9/25.
//

import RxCocoa
import RxSwift

final class CViewModel {
    private let disposeBag = DisposeBag()

    // Input
    let backButtonTap = PublishSubject<Void>()

    // Output
    let title = BehaviorRelay<String>(value: "C View Controller")
    let buttonTitle = BehaviorRelay<String>(value: "Go Back to B")

    init() {
        setupBindings()
    }

    private func setupBindings() {
        // Additional business logic can be added here
    }
}
