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

    enum NavigationCommand {
        case showCScreen
        case goBack
    }

    struct Input {
        let nextButtonTap: Observable<Void>
        let backButtonTap: Observable<Void>
    }

    struct Output {
        let title: Driver<String>
        let nextButtonTitle: Driver<String>
        let backButtonTitle: Driver<String>
        let navigationCommand: Driver<NavigationCommand>
    }

    init() {}

    func transform(input: Input) -> Output {
        let nextCommand = input.nextButtonTap
            .do(onNext: {
                print("Next button tapped in BViewModel")
            })
            .map { NavigationCommand.showCScreen }

        let backCommand = input.backButtonTap
            .do(onNext: {
                print("Back button tapped in BViewModel")
            })
            .map { NavigationCommand.goBack }

        let navigationCommand = Observable.merge(nextCommand, backCommand)
            .asDriver(onErrorJustReturn: .goBack)

        return Output(
            title: Driver.just("B View Controller"),
            nextButtonTitle: Driver.just("Go to C Screen"),
            backButtonTitle: Driver.just("Go Back"),
            navigationCommand: navigationCommand
        )
    }
}
