//
//  CalculateSumTableViewCell.swift
//  share a bill
//
//  Created by Paulina Matysiak on 23/04/2019.
//  Copyright © 2019 Paulina Matysiak. All rights reserved.
//

import UIKit

protocol CalculateSumTableViewCellDelegate {
    
}

class CalculateSumTableViewCell : UITableViewCell {
    
    @IBOutlet weak var sumIconButton: UIButton!
    @IBOutlet weak var sumNameTextField: UITextField!
    @IBOutlet weak var sumPriceTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        sumIconButton.setTitle("💰", for: .normal)
        sumNameTextField.text = "Total price"
        sumPriceTextField.placeholder = "0.0"
        sumIconButton.isAccessibilityElement = true
        sumIconButton.accessibilityIdentifier = Identifiers.sumIconButton.rawValue
        sumNameTextField.isAccessibilityElement = true
        sumNameTextField.accessibilityIdentifier = Identifiers.sumNameTextField.rawValue
        sumPriceTextField.isAccessibilityElement = true
        sumPriceTextField.accessibilityIdentifier = Identifiers.sumPriceTextField.rawValue
    }
}
