//
//  HeaderView.swift
//  MSChallenge-UIKit
//
//  Created by Vlad Chapurny on 2022-04-27.
//

import UIKit

/*
 * HeaderView
 * UIView Header text for the View Controllers.
 */
class HeaderView: UIView {

    // MARK: - Views
    
    ///Title Label
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 42, weight: .bold)
        return lbl
    }()
    
    ///Subtitle Text View
    private let subheadingTextView: UITextView = {
        let txt = UITextView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.isScrollEnabled = false
        txt.isEditable = false
        txt.isSelectable = false
        txt.textContainer.lineFragmentPadding = 0
        txt.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        txt.backgroundColor = .clear
        return txt
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    /// Convenience init for setting the title and subheading text
    /// - Parameter title: title String of the header
    /// - Parameter subheading: subheading String for the header
    convenience init(title: String, subheading: String) {
        self.init(frame: .zero)
        self.titleLabel.text = title
        self.subheadingTextView.text = subheading
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Functions
    
    /// Add and constraint Views
    private func setup() {
        addSubview(titleLabel)
        addSubview(subheadingTextView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            subheadingTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subheadingTextView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subheadingTextView.trailingAnchor.constraint(equalTo: trailingAnchor),
            subheadingTextView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
