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
	public final class Error {
		
		///
		public final class Networking {
			
			///
			public class var unknown: String {
				return Strings.localized("Error.Networking.unknown")
			}
			
			///
			public class var timedOut: String {
				return Strings.localized("Error.Networking.timedOut")
			}
			
			///
			public class var unreachable: String {
				return Strings.localized("Error.Networking.unreachable")
			}
			
		}
		
	}
	
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
