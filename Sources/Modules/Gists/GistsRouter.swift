//
//  GistsRouter.swift
//
//  Created by ViXette on 30/08/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import UIKit


final class GistRouter {
	
	private weak var viewController: UIViewController?
	
	///
	init (viewController: UIViewController) {
		self.viewController = viewController
	}
	
}

// MARK: - GistRouterProtocol
extension GistRouter: GistsRouterProtocol {
	
}
