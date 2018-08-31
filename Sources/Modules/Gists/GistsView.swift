//
//  GistsView.swift
//
//  Created by ViXette on 30/08/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import UIKit


final class GistsView: UITableViewController {
	
	var delegate: GistsViewDelegate!
	
	///
	override func viewDidLoad () {
		super.viewDidLoad()
	}
	
}

// MARK: -
extension GistsView: GistsViewProtocol {
	
}
