//
//  NetworkingError.swift
//  Domain
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation
import Strings


public enum NetworkingError: Error {
	
	case unknown
	
	case timedOut
	
	case unreachable
	
	case deserialization(MapperError)
	
}

// MARK: - LocalizedError
extension NetworkingError: LocalizedError {
	
	///
	public var errorDescription: String? {
		switch self {
			case .unknown, .deserialization:
				return Strings.Error.Networking.unknown
		
			case .timedOut:
				return Strings.Error.Networking.timedOut
	
			case .unreachable:
				return Strings.Error.Networking.unreachable
		}
	}
	
}
