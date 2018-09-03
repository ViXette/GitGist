//
//  DefaultNetworking.swift
//  Service
//
//  Created by ViXette on 01/09/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import Foundation
import Alamofire
import BrightFutures
import Result
import KnfaJson
import Domain


public final class DefaultNetworking {
	
	public let baseUrl: URL?
	
	///
	public init (baseUrl: URL?) {
		self.baseUrl = baseUrl
	}
	
}

// MARK: - Networking
extension DefaultNetworking: Networking {
	
	///
	public func send <R, T> (_ request: R, mappedBy closure: @escaping Mapper<T>) -> Future<T, AnyError> where R: Domain.Request {
		let concatenated = URL(string: request.path, relativeTo: baseUrl)
		
		guard let url = concatenated, url.host != nil else {
			fatalError("Cannot build request URL.")
		}
		
		guard let method = Alamofire.HTTPMethod(rawValue: request.method.rawValue) else {
			fatalError("Cannot find HTTP Method.")
		}
		
		switch request.payload {
			case .none:
				return Alamofire.request(url, method: method, parameters: nil, encoding: URLEncoding.default, headers: request.headers).mappableResponse(closure)
			
			case .json(let parameters):
				return Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: request.headers).mappableResponse(closure)
		}
	}
	
}

// MARK: - Alamofire.DataRequest
extension Alamofire.DataRequest {

	///
	func mappableResponse <T> (_ closure: @escaping Mapper<T>) -> Future<T, AnyError> {
		let promise = Promise<T, AnyError>()
		
		responseData { response in
			response.resolve(promise, closure: closure)
		}
		
		return promise.future
	}
	
}

// MARK: - Alamofire.DataResponse
extension Alamofire.DataResponse where Value == Data {
	
	///
	func resolve <T> (_ promise: Promise<T, AnyError>, closure: @escaping Mapper<T>) {
		switch result {
			case .success(let data):
				resolve(promise, data: data, closure: closure)
			
			case .failure(let error):
				resolve(promise, error: error)
		}
	}
	
	///
	func resolve <T> (_ promise: Promise<T, AnyError>, data: Data, closure: @escaping Mapper<T>) {
		guard let response = response else {
			return promise.failure(NetworkingError.unknown.anyError)
		}
			
		print("request url: \(response.url!) statusCode: \(response.statusCode)")
		let source: Any
		
		if let root = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
			print("responsed json: \(root)")
			source = Json(root: root)
		} else {
			source = data
		}
		
		do {
			let result = try closure(ResponseStatus(rawValue: response.statusCode), source, response.allHeaderFields)
			
			promise.success(result)
		} catch (let error as MapperError) {
			promise.failure(NetworkingError.deserialization(error).anyError)
		} catch (let error) {
			promise.failure(error.anyError)
		}
	}
	
	///
	func resolve <T> (_ promise: Promise<T, AnyError>, error: Error) {
		var resolved = NetworkingError.unknown
		
		let nsError = error as NSError
		
		if nsError.domain == NSURLErrorDomain {
			switch nsError.code {
				case NSURLErrorTimedOut:
					resolved = NetworkingError.timedOut
				case NSURLErrorCannotFindHost,
					  NSURLErrorCannotConnectToHost,
				  	  NSURLErrorNotConnectedToInternet:
					resolved = NetworkingError.unreachable
				
				default:
					break
			}
		}
		
		promise.failure(resolved.anyError)
	}
	
}
