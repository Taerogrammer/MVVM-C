//
//  BViewController.swift
//  MVVM-C
//
//  Created by 김태형 on 8/9/25.
//

import UIKit

import RxCocoa
import RxSwift

final class BViewController: UIViewController {
    weak var delegate: BViewControllerDelegate?
    private let viewModel: BViewModel
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
        button.backgroundColor = .systemPurple
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init(viewModel: BViewModel) {
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
        view.addSubview(backButton)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),

            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 44),

            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 200),
            backButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func setupBindings() {
        // Bind ViewModel to UI
        viewModel.title
            .bind(to: titleLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.nextButtonTitle
            .bind(to: nextButton.rx.title(for: .normal))
            .disposed(by: disposeBag)

        viewModel.backButtonTitle
            .bind(to: backButton.rx.title(for: .normal))
            .disposed(by: disposeBag)

        // Bind UI to ViewModel
        nextButton.rx.tap
            .bind(to: viewModel.nextButtonTap)
            .disposed(by: disposeBag)

        backButton.rx.tap
            .bind(to: viewModel.backButtonTap)
            .disposed(by: disposeBag)

        // Handle navigation
        nextButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.delegate?.showCScreenFromB()
            })
            .disposed(by: disposeBag)

        backButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.delegate?.goBackFromB()
            })
            .disposed(by: disposeBag)
    }
}
