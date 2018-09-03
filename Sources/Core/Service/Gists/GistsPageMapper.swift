//
//  GistsPageMapper.swift
//  Service
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation
import Domain
import KnfaJson


final class GistsPageMapper {
	
	///
	class func map (
		_ status: ResponseStatus,
		_ source: Any,
		_ headers: [AnyHashable: Any]
	) throws -> GistsPage {
		guard let json = source as? Json else {
			throw DefaultMapperError.unexpectedSource
		}
		
		if let _ = try? json.string(at: "error") {
			throw DefaultMapperError.unexpectedValue
		}
		
		return GistsPage(
			items: try mapItems(json, at: ""),
			number: 0
		)
	}
	
	///
	class func mapItems (_ json: Json, at path: JsonPath) throws -> [GistsItem] {
		var items = [GistsItem]()
		
		for item in try json.array(at: path) {
			guard let gist = try? mapItem(item) else {
				continue
			}
			
			items.append(gist)
		}
		
		return items
	}
	
	///
	class func mapItem(_ json: Json) throws -> GistsItem {
		return GistsItem(description: try json.string(at: "description"))
	}
	
}
