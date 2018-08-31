//
//  UserView.swift
//
//  Created by ViXette on 30/08/2018.
//  Copyright © 2018 ViXette. All rights reserved.
//

import UIKit
import SnapKit


final class UserView: UIViewController {
	
	var delegate: UserViewDelegate!
	
	// Components
	private var user_textField: UITextField!
	
	private var toGists_button: UIButton!
	
	///
	override func viewDidLoad () {
		super.viewDidLoad()
		
		view.applyBackgroundWhite()
		
		// User Text Field
		user_textField = UITextField()
		user_textField.borderStyle = .roundedRect
		user_textField.textAlignment = .center
		
		view.addSubview(user_textField)
		
		user_textField.snp.makeConstraints { maker in
			maker.centerX.equalTo(view.snp.centerX)
			maker.centerY.equalTo(view.snp.centerY)
			maker.width.equalToSuperview().offset(-view.frame.width / 4)
		}
		
		// toGists Button
		toGists_button = UIButton()
		toGists_button.addTarget(self, action: #selector(toGistsTapped), for: .touchUpInside)
		toGists_button.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
		toGists_button.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .disabled)
		
		view.addSubview(toGists_button)
		
		toGists_button.snp.makeConstraints { maker in
			maker.centerX.equalTo(view.snp.centerX)
			maker.centerY.equalTo(view.snp.centerY).offset(70)
			maker.width.equalTo(user_textField.snp.width)
		}
		
		delegate.setup()
	}
	
	@objc private func toGistsTapped () {
		delegate.toGistsTapped()
	}
	
}

// MARK: - UserViewProtocol
extension UserView: UserViewProtocol {
	
	///
	func setTitle (_ title: String) {
		navigationItem.title = title
	}
	
	///
	func setPlaceholder (_ placeholder: String) {
		user_textField.placeholder = placeholder
	}
	
	///
	func setButtonTitle (_ title: String) {
		toGists_button.setTitle(title, for: .normal)
	}
	
}
