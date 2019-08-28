//
//  ItemTableViewCell.swift
//  share a bill
//
//  Created by Paulina Matysiak on 24/03/2019.
//  Copyright © 2019 Paulina Matysiak. All rights reserved.
//

import UIKit

protocol ItemTableViewCellDelegate {
    func iconButtonTapped(_ sender: Any)
}

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemIconButton: UIButton!
    @IBOutlet weak var itemCountTextField: UITextField!
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var itemPriceTextField: UITextField!
    
    var delegate: ItemTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        itemIconButton.setTitle("", for: .normal)
        itemCountTextField.text = ""
        itemNameTextField.text = ""
        itemPriceTextField.text = ""
        itemCountTextField.placeholder = "0"
        itemNameTextField.placeholder = "Add item"
        itemPriceTextField.placeholder = "Add price"
    }
    
    func setupWithItem(item : Item?) {
        if item != nil {
            itemIconButton.setTitle(item?.icon, for: .normal)
            itemCountTextField.text = item?.quantity?.stringValue
            itemNameTextField.text = item?.name
            itemPriceTextField.text = item?.price?.stringValue
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func iconButtonTapped(_ sender: Any) {
        delegate?.iconButtonTapped(sender)
    }
}
