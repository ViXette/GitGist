//
//  Strings.swift
//  Strings
//
//  Created by ViXette on 30/08/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation


public final class Strings {
	
	///
	public final class User {
	
		///
		public final class Button {
			
			public class var title: String {
				return Strings.localized("User.Button.title")
			}
			
		}
		
		///
		public class var title: String {
			return Strings.localized("User.title")
		}
		
		///
		public class var placeholder: String {
			return Strings.localized("User.placeholder")
		}
		
	}
	
	///
	public class func localized (_ key: String) -> String {
		return NSLocalizedString(key, comment: key)
	}
	
}
