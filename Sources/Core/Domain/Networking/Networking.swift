//
//  Networking.swift
//  Domain
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation
import Result
import BrightFutures


public protocol Networking: class {
	
	var baseUrl: URL? { get }
	
	func send <R, T> (_ request: R, mappedBy closure: @escaping Mapper<T>) -> Future<T, AnyError> where R: Request
	
}
