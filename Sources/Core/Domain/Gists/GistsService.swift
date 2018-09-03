//
//  GistsService.swift
//  Domain
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation
import Result
import BrightFutures


public protocol GistsService: class {
	
	func fetchFirstPage (userName: String) -> Future<GistsPage, AnyError>
	
	func fetchNextPage (after page: GistsPage) -> Future<GistsPage, AnyError>
	
}
