//
//  Mapper.swift
//  Domain
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation


public typealias Mapper<T> = (ResponseStatus, Any, [AnyHashable: Any]) throws -> T
