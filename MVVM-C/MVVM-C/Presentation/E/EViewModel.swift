//
//  EViewModel.swift
//  MVVM-C
//
//  Created by 김태형 on 8/9/25.
//

import Foundation

import RxCocoa
import RxSwift

final class EViewModel {
    private let disposeBag = DisposeBag()

    // Input
    let nextButtonTap = PublishSubject<Void>()
    let closeButtonTap = PublishSubject<Void>()

    // Output
    let title = BehaviorRelay<String>(value: "E View Controller (Z Flow)")
    let nextButtonTitle = BehaviorRelay<String>(value: "Go to F")
    let closeButtonTitle = BehaviorRelay<String>(value: "Close Z Flow")

    init() {
        setupBindings()
    }

    private func setupBindings() {
        // Additional business logic can be added here
    }
}
