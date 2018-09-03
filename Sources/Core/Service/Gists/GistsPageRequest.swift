//
//  GistsPageRequest.swift
//  Service
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation
import Domain


final class GistsPageRequest {
	
	let userName: String
	
	let page: Int
	
	///
	init (userName: String, page: Int) {
		self.userName = userName
		self.page = page
	}
	
}

// MARK: - Request
extension GistsPageRequest: Request {
	
	///
	public var path: String {
		return "users/\(userName)/gists?page=\(page)"
	}
	
}
