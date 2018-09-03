//
//  ResponceStatus.swift
//  Domain
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation


public enum ResponseStatus: RawRepresentable {
	
	case standard(Standard)
	
	case explicit(Int)
	
	///
	public enum Standard: Int {
		
		case ok = 200
		
		case badRequest = 400

		case notFound = 404
		
	}
	
	///
	public typealias RawValue = Int
	
	///
	public init (rawValue: Int) {
		if let standard = Standard(rawValue: rawValue) {
			self = .standard(standard)
		} else {
			self = .explicit(rawValue)
		}
	}
	
	///
	public var rawValue: Int {
		switch self {
			case .standard(let value):
				return value.rawValue
			
			case .explicit(let value):
				return value
		}
	}
	
}
