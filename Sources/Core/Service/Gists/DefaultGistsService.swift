//
//  DefaultGistsService.swift
//  Service
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation
import Domain
import Result
import BrightFutures


public final class DefaultGistsService {
	
	private let networking: Networking
	
	///
	public init (networking: Networking) {
		self.networking = networking
	}
	
}

// MARK: -
extension DefaultGistsService: GistsService {

	///
	public func fetchFirstPage (userName: String) -> Future<GistsPage, AnyError> {
		let request = GistsPageRequest(userName: userName, page: 0)
		
		return networking.send(request, mappedBy: GistsPageMapper.map)
	}
	
	///
	public func fetchNextPage (after page: GistsPage) -> Future<GistsPage, AnyError> {
		let request = GistsPageRequest(userName: "userName", page: 1)
		
		return networking.send(request, mappedBy: GistsPageMapper.map)
	}
	
}
