//
//  CViewController.swift
//  MVVM-C
//
//  Created by 김태형 on 8/9/25.
//

import UIKit

import RxCocoa
import RxSwift

final class CViewController: UIViewController {
    weak var coordinator: XCoordinatorProtocol?
    private let viewModel: CViewModel
    private let disposeBag = DisposeBag()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemIndigo
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init(viewModel: CViewModel) {
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
        view.addSubview(backButton)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),

            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 200),
            backButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func setupBindings() {
        // Bind ViewModel to UI
        viewModel.title
            .bind(to: titleLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.buttonTitle
            .bind(to: backButton.rx.title(for: .normal))
            .disposed(by: disposeBag)

        // Bind UI to ViewModel
        backButton.rx.tap
            .bind(to: viewModel.backButtonTap)
            .disposed(by: disposeBag)

        // Handle navigation
        backButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.coordinator?.goBackToB()
            })
            .disposed(by: disposeBag)
    }
}
