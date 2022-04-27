//
//  CustomTextField.swift
//  MSChallenge-UIKit
//
//  Created by Vlad Chapurny on 2022-04-27.
//

import UIKit

/*
 * CustomTextField
 * Custom Designed Text Field
 */
class CustomTextField: UITextField, UITextFieldDelegate {
    
    ///the custom padding of the TextField
    private var padding = UIEdgeInsets.zero
    
    // MARK: - Init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        delegate = self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
    }
    
    /// Convenience init for setting the title and subheading text
    /// - Parameter title: placeholder String
    convenience init(title: String){
        self.init(frame: .zero)
        placeholder = title
        autocorrectionType = UITextAutocorrectionType.no
        font = UIFont.AFFontBold(size: 16)
        clearButtonMode = UITextField.ViewMode.whileEditing
        layer.borderWidth = 1.5
        layer.cornerRadius = 10
        layer.borderColor = UIColor.systemGray5.cgColor
        
        ///Updating the padding
        padding = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
    }
    
    // MARK: - Functions
    
    /// Function for handling no input value
    /// Highlights the border red if the text field is incorrect
    func checkIfEmpty() {
        if let text = self.text, !text.isEmpty {
            layer.borderColor = UIColor.systemGray5.cgColor
        } else {
            layer.borderColor = UIColor.systemRed.cgColor
        }
    }

    /// Overwriting delegate function to close keyboard when hitting 'return'
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
        return false
    }
    
    /// Overwriting main function in order to increase padding for textfield
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: padding)
        
    }
    
    /// Overwriting main function in order to increase padding when editing
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: padding)
    }
}

