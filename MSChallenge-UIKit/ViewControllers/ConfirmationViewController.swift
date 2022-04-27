//
//  ConfirmationViewController.swift
//  MSChallenge-UIKit
//
//  Created by Vlad Chapurny on 2022-04-27.
//

import UIKit

/*
 * ProfileCreationViewController
 * View Controller for the confirmation page.
 */
class ConfirmationViewController: UIViewController {
    
    /// The portfolio information
    private var portfolio: Portfolio = Portfolio()
    
    // MARK: - Views
    
    /// header view displaying the title and subtitle
    private lazy var headerView: HeaderView = {
        
        /// Checking to make sure text looks good if no name is entered.
        let title = portfolio.firstName.isEmpty ? "!" : ", \(portfolio.firstName)!"
        let v = HeaderView(title: "Hello\(title)", subheading: "Your super-awesome portfolio has been successfully submitted! The details below will be public within your community!")
        return v
    }()
    
    /// Stack containing all the information to be displayed if it exists in model
    let informationStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        return stack
    }()
    
    /// Website link text (clickable if its a valid website)
    private lazy var websiteLink: UITextView = {
        let txt = UITextView()
        txt.isEditable = false
        txt.isSelectable = true
        txt.isScrollEnabled = false
        txt.dataDetectorTypes = .link
        txt.attributedText = NSAttributedString(string: "\(portfolio.website)", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        txt.textAlignment = .center
        txt.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return txt
    }()
    
    /// Users first name
    private lazy var firstName: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        lbl.text = portfolio.firstName
        lbl.textAlignment = .center
        return lbl
    }()
    
    /// submitters first name
    private lazy var email: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        lbl.text = portfolio.email
        lbl.textAlignment = .center
        return lbl
    }()
    
    /// Sign in button (does nothing)
    private lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.customButton(title: "Sign In")
        return button
    }()
    
    // MARK: - Init
    init(portfolio: Portfolio) {
        super.init(nibName: nil, bundle: nil)
        self.portfolio = portfolio
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        /// Bounds only load here and are required to apply gradient
        signInButton.customGradient()
    }
    
    /// Function for adding views
    func setupViews() {
        
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(headerView)
        nonEmptyDataInformationStack()
        view.addSubview(informationStack)
        view.addSubview(signInButton)
    }
    
    /// Function used to check and populate informationStack
    /// if any field is empty do not include it in the information stack (the view)
    func nonEmptyDataInformationStack() {
        
        if !portfolio.website.isEmpty {
            informationStack.addArrangedSubview(websiteLink)
        }
        
        if !portfolio.firstName.isEmpty {
            informationStack.addArrangedSubview(firstName)
        }
        
        /// Should always be present based on requirements
        informationStack.addArrangedSubview(email)
    }
    
    /// Function for setting up constraints on views that have been added
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            headerView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            informationStack.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            informationStack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            informationStack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
                        
            signInButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
            signInButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
