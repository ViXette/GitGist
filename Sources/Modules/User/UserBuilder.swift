//
//  UserBuilder.swift
//
//  Created by ViXette on 30/08/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import UIKit


final class UserBuilder {
	
	private let gistsBuilder: GistsBuilder
	
	///
	init (gistsBuilder: GistsBuilder) {
		self.gistsBuilder = gistsBuilder
	}
	
	///
	func build () -> UIViewController {
		let view = UserView()
		
		let router = UserRouter(viewController: view, gistsBuilder: gistsBuilder)
		
		let presenter = UserPresenter(view: view, router: router)
		
		view.delegate = presenter
		
		return view
	}
	
}
