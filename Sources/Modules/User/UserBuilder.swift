//
//  UserBuilder.swift
//
//  Created by ViXette on 30/08/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import UIKit


final class UserBuilder {
	
	///
	func build () -> UIViewController {
		let view = UserView()
		
		let presenter = UserPresenter(view: view)
		
		view.delegate = presenter
		
		return view
	}
	
}
