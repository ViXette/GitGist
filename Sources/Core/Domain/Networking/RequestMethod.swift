//
//  RequestMethod.swift
//  Domain
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation


public enum RequestMethod: String, RawRepresentable {
	
	case options = "OPTIONS"
	
	case get     = "GET"
	
	case head    = "HEAD"
	
	case post    = "POST"
	
	case put     = "PUT"
	
	case patch   = "PATCH"
	
	case delete  = "DELETE"
	
	case trace   = "TRACE"
	
	case connect = "CONNECT"

}
