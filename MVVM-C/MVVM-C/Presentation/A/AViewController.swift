//
//  AViewController.swift
//  MVVM-C
//
//  Created by 김태형 on 8/9/25.
//

import UIKit

import RxCocoa
import RxSwift

final class AViewController: UIViewController {
    weak var coordinator: XCoordinatorProtocol?
    private let viewModel: AViewModel
    private let disposeBag = DisposeBag()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init(viewModel: AViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(titleLabel)
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),

            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func bind() {
        let input = AViewModel.Input(
            nextButtonTap: nextButton.rx.tap.asObservable()
        )

        let output = viewModel.transform(input: input)

        output.title
            .drive(titleLabel.rx.text)
            .disposed(by: disposeBag)

        output.buttonTitle
            .drive(nextButton.rx.title(for: .normal))
            .disposed(by: disposeBag)

        // Navigation Command 처리
        output.navigationCommand
            .drive(onNext: { [weak self] command in
                self?.executeNavigation(command: command)
            })
            .disposed(by: disposeBag)
    }

    private func executeNavigation(command: AViewModel.NavigationCommand) {
        switch command {
        case .showNextScreen:
            coordinator?.showNextScreenFromA()
        case .goBack:
            coordinator?.goBackToA()
        }
    }
}
