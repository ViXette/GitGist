//
//  PageFetcherDelegate.swift
//  Domain
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation


public protocol PageFetcherDelegate: class {
	
	associatedtype PageType
	
	func firstPageDidFetched (_ page: PageType)
	
	func firstPageDidFetched (_ error: Error)
	
	func nextPageDidBeginFetching ()
	
	func nextPageFetchDidCanceled ()
	
	func nextPageDidFetched (_ page: PageType)
	
	func nextPageDidFetched (_ error: Error)

}
