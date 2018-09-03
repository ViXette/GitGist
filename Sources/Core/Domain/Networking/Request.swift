//
//  Request.swift
//  Domain
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation


public protocol Request: class {
	
	var path: String { get }
	
	var method: RequestMethod { get }
	
	var headers: [String: String]? { get }
	
	var payload: RequestPayload { get }
	
}

// MARK: - extension
public extension Request {
	
	///
	public var method: RequestMethod {
		return .get
	}
	
	///
	public var headers: [String: String]? {
		return nil
	}
	
	///
	public var payload: RequestPayload {
		return .none
	}
	
}
