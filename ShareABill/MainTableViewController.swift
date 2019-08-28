//
//  ViewController.swift
//  share a bill
//
//  Created by Paulina Matysiak on 24/03/2019.
//  Copyright © 2019 Paulina Matysiak. All rights reserved.
//

import UIKit

enum SectionType {
    case itemSection
    case addSection
    case summarySection
}

let ItemTableViewCellName = "ItemTableViewCell"
let AddActionTableViewCellName = "AddActionTableViewCell"
let CalculateSumTableViewCellName = "CalculateSumTableViewCell"

class MainTableViewController: UITableViewController {

    let items : NSMutableArray = NSMutableArray()
    
    func createMockData() {
        addItem(item: Item(icon: "🥶", quantity: 20, name: "Pizza", price: 17.6))
        addItem(item: Item(icon: "🥺", quantity: 1, name: "Pizza1", price: 1.0))
        addItem(item: Item(icon: "🤬", quantity: 25, name: "Pizza2", price: 1.6))
        addItem(item: Item(icon: "🤮", quantity: 30, name: "Pizza3", price: 7.6))
        addItem(item: Item(icon: "🥰", quantity: 60, name: "Pizza4", price: 17))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMockData()
        
        let editTableViewButton : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(MainTableViewController.editTapped))
        editTableViewButton.isAccessibilityElement = true
        editTableViewButton.accessibilityIdentifier = Identifiers.editTableVievButton.rawValue
        
        self.navigationItem.rightBarButtonItem = editTableViewButton
        
        self.registerCells(tableView: tableView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func addItem(item:Any) {
        items.add(item)
    }
    
    func removeItemAtIndex(index: Int) -> Bool {
        var removeSuccess = false
        
        if index < items.count {
            items.removeObject(at: index)
            removeSuccess = true
        }
        return removeSuccess
    }
    
    func calculateSum() -> Double {
        var sum = 0.0
        for item in items {
            sum += (item as! Item).totalPrice()
        }
        return sum.rounded()
    }
    
    @objc func editTapped() {
        self.tableView.setEditing(!(self.tableView.isEditing), animated: true)
    }
}

extension MainTableViewController {
    /// TABLE VIEW DELEGATES
    //DATA SOURCE
    
    func sectionTypeFromIndexPath(_ indexPath: IndexPath) -> SectionType {
        let section = indexPath.section
        var sectionType : SectionType = .itemSection
        switch section {
        case 0:
            sectionType = .itemSection
            break
        case 1:
            sectionType = .addSection
            break
        case 2:
            sectionType = .summarySection
            break
        default:
            break
        }
        return sectionType
    }
    
    func sectionTypeFromSection(_ section: Int) -> SectionType {
        return sectionTypeFromIndexPath(IndexPath(row: 0, section: section))
    }
    
    func registerCells(tableView:UITableView) {
        self.registerNibWithName(tableView, ItemTableViewCellName)
        self.registerNibWithName(tableView, AddActionTableViewCellName)
        self.registerNibWithName(tableView, CalculateSumTableViewCellName)
    }
    
    func registerNibWithName(_ tableView:UITableView, _ nibName:String) {
        tableView.register(UINib(nibName: nibName, bundle: Bundle.main), forCellReuseIdentifier: nibName)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell
        
        switch sectionTypeFromIndexPath(indexPath) {
        case .itemSection:
            let itemCell : ItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCellName) as! ItemTableViewCell
            itemCell.setupWithItem(item: itemForIndexPath(indexPath: indexPath))
            itemCell.delegate = self
            itemCell.isAccessibilityElement = true
            itemCell.accessibilityIdentifier = Identifiers.itemCell.rawValue
            cell = itemCell
            break
        case .addSection:
            let addCell : AddActionTableViewCell = tableView.dequeueReusableCell(withIdentifier: AddActionTableViewCellName) as! AddActionTableViewCell
            addCell.delegate = self
            addCell.isAccessibilityElement = true
            addCell.accessibilityIdentifier = Identifiers.addCell.rawValue
            cell = addCell
            break
        case .summarySection:
            let summaryCell : CalculateSumTableViewCell = tableView.dequeueReusableCell(withIdentifier: CalculateSumTableViewCellName) as! CalculateSumTableViewCell
            summaryCell.sumPriceTextField.text = "\(calculateSum())"
            cell = summaryCell
            break
        }

        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3 //SEKCJE
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numberOfRows = 0
        switch sectionTypeFromSection(section) {
        case .itemSection:
            numberOfRows = self.numberOfItems()
            break
        case .addSection:
            numberOfRows = 1
            break
        case .summarySection:
            numberOfRows = 1
            break
        }
        return numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func insertItem(item : Any, _ tableView: UITableView) {
        let indexOfLastItem = self.numberOfItems()
        
        tableView.beginUpdates()
            self.addItem(item: item)
            tableView.insertRows(at: [IndexPath(row: indexOfLastItem, section: 0)], with: .bottom)
        tableView.endUpdates()
        updateTotalPrice()
    }
    
    func removeItem(index: Int, _ tableView: UITableView) {
        tableView.beginUpdates()
        if self.removeItemAtIndex(index: index) {
            tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .bottom)
        }
        tableView.endUpdates()
        updateTotalPrice()
    }
    
    func updateTotalPrice() {
        tableView.reloadSections([2], with: .none)
    }
    
    func itemForIndexPath(indexPath : IndexPath) -> Item? {
        let sectionType = sectionTypeFromIndexPath(indexPath)
        let index = indexPath.row
        var returnItem : Item? = nil
        if sectionType == .itemSection {
            returnItem = items[index] as? Item
        }
        return returnItem
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        var canEdit = false
        switch sectionTypeFromIndexPath(indexPath) {
        case .itemSection:
            canEdit = true
            break
        case .addSection, .summarySection:
            canEdit = false
            break
        }
        return canEdit
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.removeItem(index: indexPath.row, tableView)
        }
    }
}

extension MainTableViewController : AddActionTableViewCellDelegate {
    func addItemTapped(_ sender: Any) {
        self.insertItem(item: Item(), self.tableView)
    }
}

extension MainTableViewController : ItemTableViewCellDelegate {
    func iconButtonTapped(_ sender: Any) {
        showPicker(defaultItemRow: 0)
    }
}

extension MainTableViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func showPicker(defaultItemRow:Int) {
        let alert = UIAlertController(title: nil, message: "\n\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
    
        alert.view.addSubview(createPicker())
        present(alert, animated: true, completion: nil)
    }
    
    func createPicker() -> UIPickerView {
        let pickerView = UIPickerView(frame: CGRect(x: 4, y: 0, width: 390, height: 180))
        pickerView.delegate = self
        pickerView.dataSource = self
        
        return pickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return FoodItemDecorator().itemIcons().count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return FoodItemDecorator().itemIcons()[row]
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
}
