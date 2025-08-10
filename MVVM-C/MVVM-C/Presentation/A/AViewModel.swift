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

    enum NavigationCommand {
        case showNextScreen
        case goBack
    }

    struct Input {
        let nextButtonTap: Observable<Void>
    }

    struct Output {
        let title: Driver<String>
        let buttonTitle: Driver<String>
        let navigationCommand: Driver<NavigationCommand>
    }

    init() {}

    func transform(input: Input) -> Output {
        let navigationCommand = input.nextButtonTap
            .do(onNext: {
                print("Next button tapped in AViewModel - processing business logic")
            })
            .map { NavigationCommand.showNextScreen }
            .asDriver(onErrorJustReturn: .goBack)

        // Output 생성
        let title = Driver.just("A View Controller")
        let buttonTitle = Driver.just("Go to Next Screen")

        return Output(
            title: title,
            buttonTitle: buttonTitle,
            navigationCommand: navigationCommand
        )
    }
}
