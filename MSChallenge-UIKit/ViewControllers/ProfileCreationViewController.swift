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
        let v = HeaderView(title: "Profile Creation", subheading: "Use the form below to submit your portfolio.\nAn email and password are required.")
        return v
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
        view.addSubview(submitButton)
    }
    
    ///Set Constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            headerView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            submitButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            submitButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            submitButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            submitButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

