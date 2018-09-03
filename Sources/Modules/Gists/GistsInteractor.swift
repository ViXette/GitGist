//
//  GistsInteractor.swift
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation
import Domain


final class GistsInteractor {
	
	weak var delegate: GistsInteractorDelegate?
	
	private let pageFetcher: PageFetcher
	
	private let gistsService: GistsService
	
	///
	init (pageFetcher: PageFetcher, gistsService: GistsService) {
		self.pageFetcher = pageFetcher
		self.gistsService = gistsService
	}
	
}

// MARK: -
extension GistsInteractor: GistsInteractorProtocol {
	
	///
	func fetchPage () {
		pageFetcher.fetchFirstPage(with: self, gistsService.fetchFirstPage(userName: "v"))
	}
	
}

// MARK: - PageFetcherDelegate
extension GistsInteractor: PageFetcherDelegate {
	
	typealias PageType = GistsPage
	
	func firstPageDidFetched(_ page: PageType) {
		//delegate?.firstPageDidFetched(page.items)
	}
	
	func firstPageDidFetched(_ error: Error) {
		//delegate?.firstPageDidFetched(error)
	}
	
	func nextPageDidBeginFetching() {
		//delegate?.nextPageDidBeginFetching()
	}
	
	func nextPageFetchDidCanceled() {
		//delegate?.nextPageFetchDidCanceled()
	}
	
	func nextPageDidFetched(_ page: PageType) {
		//delegate?.nextPageDidFetched(page.items)
	}
	
	func nextPageDidFetched(_ error: Error) {
		//delegate?.nextPageDidFetched(error)
	}
	
}
