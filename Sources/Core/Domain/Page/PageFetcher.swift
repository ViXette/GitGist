//
//  PageFetcher.swift
//  Domain
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Result
import BrightFutures


public protocol PageFetcher: class {
	
	func fetchFirstPage <P, D> (with delegate: D, _ closure: @autoclosure () -> Future<P, AnyError>)
		where P: PageProtocol, D: PageFetcherDelegate, D.PageType == P
	
	func fetchNextPage <P, D> (with delegate: D, _ closure: (P) -> Future<P, AnyError>)
		where P: PageProtocol, D: PageFetcherDelegate, D.PageType == P
	
}
