//
//  EquipmentsVC.swift
//  Go Trekkers
//
//  Created by Parth Patel on 02/04/24.
//

import UIKit

class EquipmentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var equipmentImg: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgView.layer.cornerRadius = 20
        self.bgView.clipsToBounds = true
        // Customize cell appearance here
    }
    
   
}

class EquipmentsVC: UIViewController {
    let equipmentData: [(name: String, details: String,url : URL?)] = [
            ("Backpack", "Capacity: 40-60 liters, Waterproof cover", URL(string: "https://tripole.in/products/walker-65l-black?variant=3317760884760&currency=INR&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic&gad_source=1&gclid=CjwKCAjw_LOwBhBFEiwAmSEQAQqDYqmQZLNY6f9CZ_VLx11XCOF_qS_0ZklddB5gRUbb5UupYbdPIBoCmBAQAvD_BwE")),
            ("Trekking Boots", "Waterproof, Ankle support",URL(string: "https://baccabucci.com/products/waterproof-snow-boots-flame-7-eye-moto-inspired-boots-bacca-bucci?variant=42447282503926&currency=INR&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic&utm_source=google&utm_medium=cpc&utm_campaign=&utm_term=&gad_source=1&gclid=CjwKCAjw_LOwBhBFEiwAmSEQAXm-kmvZcvCwYrToioHYnaDhe25pGzBK2ISUcS9p8S8jlUfK1iKU5RoCoAEQAvD_BwE")),
            ("Tent", "Capacity: 2-person, Lightweight, Waterproof",URL(string: "https://www.amazon.in/NikrimTMWaterproof-Polyester-Camping-Outdoor-Person/dp/B0BRL7MDFZ/ref=asc_df_B0BRL7MDFZ/?tag=googleshopdes-21&linkCode=df0&hvadid=649488887730&hvpos=&hvnetw=g&hvrand=4584046054143649240&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9061760&hvtargid=pla-1964185965002&mcid=0727e91ff3453f7ab701204824a6cdce&th=1")),
            ("Sleeping Bag", "Temperature rating: Suitable for destination climate",URL(string: "https://www.amazon.in/Lyrovo-Sleeping-Travel-Camping-Women/dp/B09ND4723J/ref=asc_df_B09ND4723J/?tag=googleshopdes-21&linkCode=df0&hvadid=545093353563&hvpos=&hvnetw=g&hvrand=13513213681861032947&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9061760&hvtargid=pla-1544161347760&psc=1&mcid=c9531ee2e6c634e48b0fd641ed98aaac&gclid=CjwKCAjw_LOwBhBFEiwAmSEQAafiKXnFmo81bASaNiMuIBF8Tox8j4HxCa7sOWGiw9hiJ-EbavN52hoCkD0QAvD_BwE")),
            ("Hiking Poles", "Adjustable length, Shock absorption",URL(string: "https://www.amazon.in/RudraLand-Collapsible-Lightweight-Adjustable-Accessories/dp/B0CFJTS69C/ref=asc_df_B0CFJTS69C/?tag=googleshopdes-21&linkCode=df0&hvadid=670468453860&hvpos=&hvnetw=g&hvrand=16668465049795684885&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9061760&hvtargid=pla-2223988696529&psc=1&mcid=f9c1c8384c793c54bda983a8dfdcb409")),
            ("Water Bottle", "Capacity: 1-2 liters, BPA-free",URL(string: "https://headway.rabitat.com/products/oslo-750ml?variant=42048509182141&currency=INR&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic&utm_source-google=&utm_medium=cpc&utm_campaign=21059852552&gad_source=1&gclid=CjwKCAjw_LOwBhBFEiwAmSEQAXXwGnXwFyI37-cRBSh3JzSNT1Rc7tNQyRsq777Hgw6xfVJXP7b8BRoCXdEQAvD_BwE")),
            ("First Aid Kit", "Bandages, Antiseptic wipes, Pain relievers, etc.",URL(string: "https://www.amazon.in/Primelife-Rectangular-Medicine-Box-Storage/dp/B0CLVL9DLH/ref=asc_df_B0CLVL9DLH/?tag=googleshopdes-21&linkCode=df0&hvadid=666264820032&hvpos=&hvnetw=g&hvrand=12788993315868081849&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9061760&hvtargid=pla-2263314547176&psc=1&mcid=c6aa86e6948a34adbd85f36004314cf1")),
            ("Map & Compass", "Or GPS device with extra batteries",URL(string: "https://www.amazon.in/Ultimate-Survival-Technologies-20-310-455C-Compass/dp/B00F1CW1U4?source=ps-sl-shoppingads-lpcontext&ref_=fplfs&psc=1&smid=A324FKG9CG7HUT")),
            ("Headlamp", "With extra batteries",URL(string: "https://www.amazon.in/Headlamp-Rechargeable-Headlight-Weatherproof-Battery/dp/B0BNXVT28K/ref=asc_df_B0BNXVT28K/?tag=googleshopdes-21&linkCode=df0&hvadid=649422464096&hvpos=&hvnetw=g&hvrand=12392590643971439828&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9061760&hvtargid=pla-1966098377685&psc=1&mcid=106275407f0b37d2baf94b37614e7d8d")),
            ("Sun Protection", "Sunscreen, Sunglasses, Hat",URL(string: "https://www.amazon.in/GRAND-PITSTOP-Protected-Face-Activities/dp/B0826233N2/ref=asc_df_B0826233N2/?tag=googleshopdes-21&linkCode=df0&hvadid=397083265586&hvpos=&hvnetw=g&hvrand=7085419858825833232&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9061760&hvtargid=pla-868611371742&mcid=2511684e533e391da269fe4be73be4d8&ext_vrnc=hi&gclid=CjwKCAjw_LOwBhBFEiwAmSEQAT0Q2ELHEM1nqhcSq3P-SXEYD36WuuPWO2awhzk5lCw7P4U7KLezQxoCCqYQAvD_BwE&th=1")),
//            ("Food", "High-energy snacks, Meals for duration of trek"),
//            ("Clothing", "Layered clothing for various weather conditions"),
//            ("Emergency Shelter", "Lightweight, Reflective material"),
//            ("Multi-tool/Knife", "Swiss Army Knife or equivalent"),
//            ("Personal Items", "ID, Money, Permit, Mobile phone"),
        ]
    @IBOutlet weak var equipCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Equipments"
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

extension EquipmentsVC : UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return equipmentData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EquipmentCollectionViewCell", for: indexPath as IndexPath) as! EquipmentCollectionViewCell
               
               // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.nameLbl.text = self.equipmentData[indexPath.row].name // The row value is the same as the index of the desired text within the array.
        cell.equipmentImg.image = UIImage(named: self.equipmentData[indexPath.row].name) // make cell more visible in our example project
               
               return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: equipCV.frame.width/2 - 5, height: equipCV.frame.height/3 - 5)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EquipmentBuyVC") as! EquipmentBuyVC
        vc.productData = self.equipmentData[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

class EquipmentBuyVC : UIViewController {
    var productData : (name: String, details: String,url : URL?)?
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var productLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bgView.layer.cornerRadius = 20
        self.bgView.clipsToBounds = true
        self.loadData(productData: productData!)
    }
    
    @IBAction func buyBtn(_ sender: UIButton) {
        if UIApplication.shared.canOpenURL((productData?.url)!) {
                UIApplication.shared.open((productData?.url)!, options: [:], completionHandler: nil)
            } else {
                print("Cannot open URL")
            }
    }
    func loadData(productData : (name: String, details: String,url : URL?)) {
        self.productLbl.text = productData.name
        self.descriptionLbl.text = productData.details
    }
    
}
