//
//  Page.swift
//  Domain
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation


public class Page <ItemType> {
	
	public let items: [ItemType]
	
	public let number: Int
	
	///
	public init (items: [ItemType], number: Int) {
		self.items = items
		self.number = number
	}
	
}

// MARK: - PageProtocol
extension Page: PageProtocol {

}
