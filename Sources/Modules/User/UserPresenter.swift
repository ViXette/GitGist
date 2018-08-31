//
//  UserPresenter.swift
//
//  Created by ViXette on 30/08/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation
import Strings


final class UserPresenter {
	
	private weak var view: UserViewProtocol?
	
	private let router: UserRouterProtocol
	
	///
	init (view: UserViewProtocol, router: UserRouterProtocol) {
		self.view = view
		self.router = router
	}
	
}

extension UserPresenter: UserViewDelegate {
	
	///
	func setup () {
		view?.setTitle(Strings.User.title)
		
		view?.setPlaceholder(Strings.User.placeholder)
		
		view?.setButtonTitle(Strings.User.Button.title)
	}
	
	///
	func toGistsTapped () {
		router.presentGists()
	}
	
}
