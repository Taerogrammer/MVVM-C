//
//  DViewController.swift
//  MVVM-C
//
//  Created by 김태형 on 8/9/25.
//

import UIKit

import RxCocoa
import RxSwift

final class DViewController: UIViewController {
    weak var coordinator: YCoordinatorProtocol?
    private let viewModel: DViewModel
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
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init(viewModel: DViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
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

    private func setupBindings() {
        // Bind ViewModel to UI
        viewModel.title
            .bind(to: titleLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.buttonTitle
            .bind(to: nextButton.rx.title(for: .normal))
            .disposed(by: disposeBag)

        // Bind UI to ViewModel
        nextButton.rx.tap
            .bind(to: viewModel.nextButtonTap)
            .disposed(by: disposeBag)

        // Handle navigation
        nextButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.coordinator?.showNextScreenFromD()
            })
            .disposed(by: disposeBag)
    }
}
