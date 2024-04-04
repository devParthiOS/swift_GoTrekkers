//
//  ChecklistVC.swift
//  Go Trekkers
//
//  Created by Parth Patel on 02/04/24.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var checkmarkImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var onSelectionChange: (() -> Void)?
    var isChecked = false {
        didSet {
            checkmarkImageView.image = isChecked ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "square")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(checkmarkTapped))
        addGestureRecognizer(tapGesture)
    }
    
    @objc func checkmarkTapped() {
        isChecked.toggle()
        onSelectionChange?()
    }
    
    func configure(equipmentName: String, isChecked: Bool) {
        nameLabel.text = equipmentName
        self.isChecked = isChecked
    }
}


class ChecklistVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var resetButton: UIButton!
    
    let equipmentData: [(name: String, details: String)] = [
        ("Backpack", "Capacity: 40-60 liters, Waterproof cover"),
        ("Trekking Boots", "Waterproof, Ankle support"),
        ("Tent", "Capacity: 2-person, Lightweight, Waterproof"),
        ("Sleeping Bag", "Temperature rating: Suitable for destination climate"),
        ("Hiking Poles", "Adjustable length, Shock absorption"),
        ("Water Bottle", "Capacity: 1-2 liters, BPA-free"),
        ("First Aid Kit", "Bandages, Antiseptic wipes, Pain relievers, etc."),
        ("Map & Compass", "Or GPS device with extra batteries"),
        ("Headlamp/Flashlight", "With extra batteries"),
        ("Sun Protection", "Sunscreen, Sunglasses, Hat"),
        ("Food", "High-energy snacks, Meals for duration of trek"),
        ("Clothing", "Layered clothing for various weather conditions"),
        ("Emergency Shelter", "Lightweight, Reflective material"),
        ("Multi-tool/Knife", "Swiss Army Knife or equivalent"),
        ("Personal Items", "ID, Money, Permit, Mobile phone"),
        ("Rain Jacket", "Waterproof, Breathable fabric"),
        ("Mosquito Repellent", "DEET-based or natural repellent"),
        ("Trekking Socks", "Moisture-wicking, Cushioned soles"),
        ("Gaiters", "To protect ankles from debris and water"),
        ("Whistle", "Emergency signaling device"),
        ("Camera", "For capturing memorable moments"),
        ("Binoculars", "For observing wildlife and scenery"),
        ("Insect Bite Relief", "Antihistamine cream or stick"),
        ("Water Purification Tablets", "For safe drinking water"),
        ("Portable Stove", "For cooking meals on the trail")
    ]
    
    var checklist: [String: Bool] = [:] // Dictionary to store checklist items
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Checklist"
        tableView.dataSource = self
        tableView.delegate = self
        // Create a UIBarButtonItem with a title
        let addButton = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(addButtonTapped))

                // Assign the button to the rightBarButtonItem property of the navigationItem
                navigationItem.rightBarButtonItem = addButton
        loadChecklist()
        updateResetButtonState()
    }
    // Function to handle the button tap
        @objc func addButtonTapped() {
            // Handle button tap action
            checklist.removeAll()
            tableView.reloadData()
            saveChecklist()
//            updateResetButtonState()
        }
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return equipmentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistTableViewCell", for: indexPath) as! ChecklistTableViewCell
        let equipment = equipmentData[indexPath.row]
        cell.configure(equipmentName: equipment.name, isChecked: checklist[equipment.name] ?? false)
        cell.onSelectionChange = { [weak self] in
            self?.checklist[equipment.name] = cell.isChecked
            self?.saveChecklist()
            self?.updateResetButtonState()
        }
        return cell
    }
    
    // MARK: - User Defaults
    
    private func loadChecklist() {
        if let savedChecklist = UserDefaults.standard.dictionary(forKey: "Checklist") as? [String: Bool] {
            checklist = savedChecklist
        }
    }
    
    private func saveChecklist() {
        UserDefaults.standard.set(checklist, forKey: "Checklist")
    }
    
    // MARK: - Reset Button
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        checklist.removeAll()
        tableView.reloadData()
        saveChecklist()
//        updateResetButtonState()
    }
    
    private func updateResetButtonState() {
//        resetButton.isEnabled = !checklist.isEmpty
    }
}

