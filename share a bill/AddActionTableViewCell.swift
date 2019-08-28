//
//  AddActionTableViewCell.swift
//  share a bill
//
//  Created by Paulina Matysiak on 24/03/2019.
//  Copyright © 2019 Paulina Matysiak. All rights reserved.
//

import UIKit

protocol AddActionTableViewCellDelegate {
    func addItemTapped(_ sender: Any)
}

class AddActionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addNewItemLabel: UILabel!
  
    var delegate: AddActionTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        addNewItemLabel.text = "Add new item"
        addNewItemLabel.isAccessibilityElement = true
        addNewItemLabel.accessibilityIdentifier = Identifiers.addNewLabel.rawValue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addItemTapped(_ sender: Any) {
        delegate?.addItemTapped(sender)
    }
}
