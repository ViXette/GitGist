//
//  GistsPresenter.swift
//
//  Created by ViXette on 30/08/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation


final class GistsPresenter {
	
	private weak var view: GistsViewProtocol?
	
	private let router: GistsRouterProtocol
	
	private let interactor: GistsInteractorProtocol
	
	///
	init (view: GistsViewProtocol, router: GistsRouterProtocol, interactor: GistsInteractorProtocol) {
		self.view = view
		self.router = router
		self.interactor = interactor
	}
	
}

// MARK: - GistsViewDelegate
extension GistsPresenter: GistsViewDelegate {
	
	///
	func setup () {
		interactor.fetchPage()
	}
	
}

// MARK: - GistsInteractorDelegate
extension GistsPresenter: GistsInteractorDelegate {
	
}
