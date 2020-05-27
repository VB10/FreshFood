//
//  Application.swift
//  SwiftHub
//
//  Created by Khoren Markosyan on 1/5/18.
//  Copyright © 2018 Khoren Markosyan. All rights reserved.
//

import UIKit

final class Application: NSObject {
    static let shared = Application()

    var window: UIWindow?
    let navigator: Navigator

    private override init() {
        super.init()
    }


    func presentInitialScreen(in window: UIWindow?) {
        updateProvider()
        guard let window = window, let provider = provider else { return }
        self.window = window

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if let user = User.currentUser(), let login = user.login {
                analytics.identify(userId: login)
                analytics.set(.name(value: user.name ?? ""))
                analytics.set(.email(value: user.email ?? ""))
            }

            let viewModel = HomeTabBarViewModel(provider: provider)
            self.navigator.show(segue: .tabs(viewModel: viewModel), sender: nil, transition: .root(in: window))
        }
    }

    func presentTestScreen(in window: UIWindow?) {
        guard let window = window, let provider = provider else { return }
        let viewModel = UserViewModel(user: User(), provider: provider)
        navigator.show(segue: .userDetails(viewModel: viewModel), sender: nil, transition: .root(in: window))
    }
}
