//
//  MountainsVC.swift
//  Go Trekkers
//
//  Created by Parth Patel on 02/04/24.
//

import UIKit

class MountainTBCell : UITableViewCell {
    
    @IBOutlet weak var mountainImg: UIImageView!
    @IBOutlet weak var mountainLbl: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        if selected {
            contentView.backgroundColor = #colorLiteral(red: 0.1960149705, green: 0.3204125166, blue: 0.2596133649, alpha: 1)
        } else {
            contentView.backgroundColor = UIColor.clear
        }
    }
}

class MountainsVC: UIViewController {
    
    
    let mountainData = ["Mount Everest", "Kangchenjunga", "Nanda Devi", "Kamet", "Saltoro Kangri", "Trisul", "Dunagiri", "Mana Peak", "Anamudi", "Shivling"]
    
    @IBOutlet weak var mountainTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mountains"
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension MountainsVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mountainData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MountainTBCell", for: indexPath) as! MountainTBCell
        cell.mountainLbl.text = self.mountainData[indexPath.row]
        cell.mountainImg.image = UIImage(named: self.mountainData[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MountainDetailVC") as! MountainDetailVC
        vc.mountainAtIndex = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

class MountainDetailVC : UIViewController {
    var mountainAtIndex : Int = 0
    @IBOutlet weak var mountainImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var daysLbl: UILabel!
    @IBOutlet weak var oxygenLbl: UILabel!
    @IBOutlet weak var bgCardView: UIView!
    let mountainData: [(name: String, height: Double, daysRequired: Int, oxygenLevel: String, description: String)] = [
        ("Mount Everest", 8848, 40, "Low", "Mount Everest is the tallest mountain in the world and is a dream destination for climbers."),
        ("Kangchenjunga", 8586, 60, "Low", "Kangchenjunga is the third highest mountain in the world and is known for its challenging terrain."),
        ("Nanda Devi", 7816, 20, "Moderate", "Nanda Devi is the highest mountain entirely within India and offers stunning views of the surrounding peaks."),
        ("Kamet", 7756, 25, "Moderate", "Kamet is the second highest mountain in India and is known for its steep slopes."),
        ("Saltoro Kangri", 7742, 30, "Moderate", "Saltoro Kangri is a mountain in the Karakoram range and is known for its remote location."),
        ("Trisul", 7120, 10, "Moderate", "Trisul is a group of three Himalayan mountain peaks and is a popular trekking destination."),
        ("Dunagiri", 7066, 15, "Moderate", "Dunagiri is a mountain in the Garhwal Himalayas and offers a challenging climb."),
        ("Mana Peak", 7272, 20, "Moderate", "Mana Peak is located near the India-China border and offers breathtaking views of the surrounding valleys."),
        ("Anamudi", 2695, 2, "High", "Anamudi is the highest peak in South India and is known for its diverse flora and fauna."),
        ("Shivling", 6543, 15, "Moderate", "Shivling is a mountain in the Garhwal Himalayas and is considered sacred by Hindus."),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bgCardView.layer.cornerRadius = 20
        self.loadData(withIndex: mountainAtIndex)
        // Do any additional setup after loading the view.
    }
    func loadData(withIndex : Int){
        self.mountainImg.image = UIImage(named: mountainData[withIndex].name)
        self.nameLbl.text = mountainData[withIndex].name
        self.descriptionLbl.text = mountainData[withIndex].description
        self.heightLbl.text = "\(mountainData[withIndex].height)m"
        self.daysLbl.text = "\(mountainData[withIndex].daysRequired) Days"
        self.oxygenLbl.text = mountainData[withIndex].oxygenLevel
        
    }
    
}
