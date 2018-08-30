//
//  AppRegistry.swift
//
//  Created by ViXette on 30/08/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation
import Swinject


final class AppRegistry {
	
	///
	class func register(_ container: Container) {
		container.register(UserBuilder.self) {
			resolver -> UserBuilder in
			
			return UserBuilder()
		}
	}
	
}
