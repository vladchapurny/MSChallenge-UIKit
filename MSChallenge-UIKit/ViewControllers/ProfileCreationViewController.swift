//
//  ProfileCreationViewController.swift
//  MSChallenge-UIKit
//
//  Created by Vlad Chapurny on 2022-04-27.
//

import UIKit

/*
 * ProfileCreationViewController
 * View Controller for the main profile creation page.
 */
class ProfileCreationViewController: UIViewController {

    // MARK: - Views
    
    ///Profile Portfolio Model
    private var portfolio: Portfolio = Portfolio()
    
    ///Header View
    private let headerView: HeaderView = {
        let headerView = HeaderView(title: "Profile Creation", subheading: "Use the form below to submit your portfolio.\nAn email and password are required.")
        return headerView
    }()
    
    ///User submit form
    private let formStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    private let firstName: UITextField = {
        let tf = UITextField()
        tf.placeholder = "First Name"
        tf.autocorrectionType = UITextAutocorrectionType.no
        tf.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        return tf
    }()
    
    private let email: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email Address"
        tf.autocorrectionType = UITextAutocorrectionType.no
        tf.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        return tf
    }()
    
    private let password: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.autocorrectionType = UITextAutocorrectionType.no
        tf.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        return tf
    }()
    
    private let website: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Website"
        tf.autocorrectionType = UITextAutocorrectionType.no
        tf.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        return tf
    }()
    
    ///Submit Button
    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }

    // MARK: - Functions
    
    ///Set views
    func setupViews() {
        
        view.addSubview(headerView)
        [firstName, email, password, website].forEach { formStack.addArrangedSubview($0) }
        view.addSubview(formStack)
        view.addSubview(submitButton)
    }
    
    ///Set Constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            headerView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            formStack.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30),
            formStack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            formStack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            submitButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            submitButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            submitButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            submitButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

