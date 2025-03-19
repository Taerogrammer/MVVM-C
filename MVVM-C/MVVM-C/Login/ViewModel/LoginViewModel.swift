//
//  LoginViewModel.swift
//  MVVM-C
//
//  Created by 김태형 on 3/19/25.
//

import Foundation

final class LoginViewModel {
    var username: String = ""
    var password: String = ""

    var loginSuccess: (() -> Void)?
    var loginFailure: ((String) -> Void)?

    func login() {
        if username == "admin" && password == "1234" {
            loginSuccess?()  // << 성공 시 Coordinator로 전달
        } else {
            loginFailure?("로그인 실패: 아이디 또는 비밀번호가 올바르지 않습니다.")
        }
    }
}
