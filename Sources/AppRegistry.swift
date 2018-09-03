//
//  AppRegistry.swift
//
//  Created by ViXette on 30/08/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation
import Swinject
import Domain
import Service


final class AppRegistry {
	
	 private static let baseUrlName = "baseUrl"
	
	///
	class func register(_ container: Container) {
		
		container.register(URL?.self, name: baseUrlName) {
			resolver -> URL? in
			
			return URL(string: "https://api.github.com/")
		}
		
		container.register(Networking.self) {
			resolver -> Networking in
			
			return DefaultNetworking(baseUrl: resolver.resolve(baseUrlName))
		}
		
		container.register(PageFetcher.self) {
			resolver -> PageFetcher in
			
			return DefaultPageFetcher()
		}
		
		container.register(GistsService.self) {
			resolver -> GistsService in
			
			return DefaultGistsService(networking: resolver.resolve())
		}
		
		container.register(UserBuilder.self) {
			resolver -> UserBuilder in
			
			return UserBuilder(gistsBuilder: resolver.resolve())
		}
		
		container.register(GistsBuilder.self) {
			resolver -> GistsBuilder in
			
			return GistsBuilder(pageFetcher: resolver.resolve(), gistsService: resolver.resolve())
		}
	}
	
}

// MARK: - Resolver
extension Resolver {
	
	///
	func resolve <T> () -> T{
		guard let instance = resolve(T.self) else {
			fatalError("Cannot resolve instance of `\(T.self)`.")
		}
		
		return instance
	}
	
	///
	func resolve <T> (_ name: String) -> T {
		guard let instance = resolve(T.self, name: name) else {
			fatalError("Cannot resolve instance of `\(T.self)` with name `\(name)`.")
		}
		
		return instance
	}
	
}
