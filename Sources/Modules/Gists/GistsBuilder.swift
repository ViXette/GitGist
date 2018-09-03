//
//  GistsBuilder.swift
//
//  Created by ViXette on 30/08/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import UIKit
import Domain


final class GistsBuilder {
	
	private let pageFetcher: PageFetcher
	
	private let gistsService: GistsService
	
	///
	init (pageFetcher: PageFetcher, gistsService: GistsService) {
		self.pageFetcher = pageFetcher
		self.gistsService = gistsService
	}
	
	///
	func build () -> UITableViewController {
		let view = GistsView()
		
		let router = GistRouter(viewController: view)
		
		let interactor = GistsInteractor(pageFetcher: pageFetcher, gistsService: gistsService)
		
		let presenter = GistsPresenter(view: view, router: router, interactor: interactor)
		
		interactor.delegate = presenter
		view.delegate = presenter
		
		return view
	}
	
}
