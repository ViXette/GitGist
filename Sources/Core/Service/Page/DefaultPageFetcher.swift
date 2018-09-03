//
//  DefaultPageFetcher.swift
//  Service
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Result
import BrightFutures
import Domain


public final class DefaultPageFetcher {
	
	private var fetching = false

	private var page: PageProtocol?
	
	private var token = InvalidationToken()
	
	///
	public init () {
		
	}
	
	///
	private func invalidate () {
		token.invalidate()
		token = InvalidationToken()
	}

}

// MARK: - PageFetcher
extension DefaultPageFetcher: PageFetcher {

	///
	public func fetchFirstPage <P, D> (with delegate: D, _ closure: @autoclosure () -> Future<P, AnyError>)
		where P: PageProtocol, D: PageFetcherDelegate, D.PageType == P {
			
		fetching = true
		
		invalidate()
		
		closure().onComplete(token.validContext) { [weak delegate] (result: Result<P, AnyError>) in
			self.fetching = false
			
			switch result {
				case .success(let page):
					self.page = page
			
					delegate?.firstPageDidFetched(page)
				
				case .failure(let error):
					delegate?.firstPageDidFetched(error.error)
			}
		}
	}
	
	///
	public func fetchNextPage <P, D> (with delegate: D, _ closure: (P) -> Future<P, AnyError>)
		where P: PageProtocol, D: PageFetcherDelegate, D.PageType == P {
			
		guard let current = page as? P, !fetching else {
			return
		}
		
		delegate.nextPageDidBeginFetching()
		
		let token = self.token
		
		token.future.onFailure {
			[weak delegate] _ in
			delegate?.nextPageFetchDidCanceled()
		}
		
		closure(current).onComplete(token.validContext) { [weak delegate] (result: Result<P, AnyError>) in
			switch result {
				case .success(let page):
					self.page = page
					
					delegate?.nextPageDidFetched(page)
	
				case .failure(let error):
					delegate?.nextPageDidFetched(error.error)
			}
		}
	}
	
}
