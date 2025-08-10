//
//  DIContainer.swift
//  MVVM-C
//
//  Created by 김태형 on 8/10/25.
//

import Foundation

import Swinject

class DIContainer {
    static let shared = DIContainer()
    let container = Container()

    private init() {
        registerDependencies()
    }

    private func registerDependencies() {
        registerViewModels()
        registerViewControllers()
    }

    // TODO: - Presentation Layer는 메서드로 반환할 지 고민해보기
    private func registerViewModels() {
        container.register(AViewModel.self) { _ in AViewModel() }
        container.register(BViewModel.self) { _ in BViewModel() }
        container.register(CViewModel.self) { _ in CViewModel() }
        container.register(DViewModel.self) { _ in DViewModel() }
        container.register(EViewModel.self) { _ in EViewModel() }
        container.register(FViewModel.self) { _ in FViewModel() }
    }

    private func registerViewControllers() {
        container.register(AViewController.self) { resolver in
            let viewModel = resolver.resolve(AViewModel.self)!
            return AViewController(viewModel: viewModel)
        }
        container.register(BViewController.self) { resolver in
            let viewModel = resolver.resolve(BViewModel.self)!
            return BViewController(viewModel: viewModel)
        }
        container.register(CViewController.self) { resolver in
            let viewModel = resolver.resolve(CViewModel.self)!
            return CViewController(viewModel: viewModel)
        }
        container.register(DViewController.self) { resolver in
            let viewModel = resolver.resolve(DViewModel.self)!
            return DViewController(viewModel: viewModel)
        }
        container.register(EViewController.self) { resolver in
            let viewModel = resolver.resolve(EViewModel.self)!
            return EViewController(viewModel: viewModel)
        }
        container.register(FViewController.self) { resolver in
            let viewModel = resolver.resolve(FViewModel.self)!
            return FViewController(viewModel: viewModel)
        }
    }
}
