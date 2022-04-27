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
    
    /// FirstName TextField
    private let firstName: CustomTextField = {
        return CustomTextField(title: "First Name")
    }()
    
    /// Email TextField
    private let email: CustomTextField = {
        let tf = CustomTextField(title: "Email Address")
        tf.keyboardType = .emailAddress
        /// Added to avoid keychain saving
        tf.textContentType = .oneTimeCode
        return tf
    }()
    
    /// Password TextField
    private let password: CustomTextField = {
        let tf = CustomTextField(title: "Password")
        tf.isSecureTextEntry = true
        /// Added to avoid keychain saving
        tf.textContentType = .oneTimeCode
        return tf
    }()
    
    /// Website TextField
    private let website: CustomTextField = {
        let tf = CustomTextField(title: "Website")
        tf.keyboardType = .URL
        return tf
    }()
    
    ///Submit Button
    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.customButton(title: "Submit")
        button.addTarget(self, action: #selector(submitButtonTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        /// Bounds only load here and are required to apply gradient
        submitButton.customGradient()
    }

    // MARK: - ObjC Functions
    
    @objc fileprivate func submitButtonTap() {
        
        if let password = password.text, let email = email.text,
            !password.isEmpty, !email.isEmpty {
            
            portfolio.firstName = self.firstName.text ?? ""
            portfolio.email = self.email.text ?? ""
            portfolio.password = self.password.text ?? ""
            portfolio.website = self.website.text ?? ""
            
            // TODO: Go to next page.
            
        } else {
            
            /// Highlight TextFields borders red if either of the required elements are empty
            password.checkIfEmpty()
            email.checkIfEmpty()
        }
    }
    
    // MARK: - Functions
    
    ///Set views
    func setupViews() {
        view.backgroundColor = UIColor.systemBackground
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

