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
    
}
