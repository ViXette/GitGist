//
//  MapperError.swift
//  Domain
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation


public protocol MapperError: Error {

}

///
public enum DefaultMapperError: MapperError {
	
	case unexpectedSource
	
	case unexpectedValue
	
}
