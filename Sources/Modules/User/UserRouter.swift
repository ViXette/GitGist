//
//  UserRouter.swift
//
//  Created by ViXette on 30/08/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import UIKit


final class UserRouter {
	
	private weak var viewController: UIViewController?
	
	private let gistsBuilder: GistsBuilder
	
	///
	init (viewController: UIViewController, gistsBuilder: GistsBuilder) {
		self.viewController = viewController
		self.gistsBuilder = gistsBuilder
	}
	
}

// MARK: - UserRouterProtocol
extension UserRouter: UserRouterProtocol {
	
	///
	func presentGists() {
		guard let viewController = self.viewController else { return }
		
		viewController.navigationController?.pushViewController(gistsBuilder.build(), animated: true)
	}
	
}
