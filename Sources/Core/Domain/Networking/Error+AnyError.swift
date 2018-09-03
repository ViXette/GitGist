//
//  Error+AnyError.swift
//  Domain
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Result


public extension Error {
	
	///
	public var anyError: AnyError {
		return self as? AnyError ?? AnyError(self)
	}
	
}
