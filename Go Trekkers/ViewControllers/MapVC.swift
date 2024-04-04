//
//  MapVC.swift
//  Go Trekkers
//
//  Created by Parth Patel on 02/04/24.
//

import UIKit
import MapKit

struct Mountain {
    let name: String
    let location: String
    let itinerary: String
    let transportation: String
    let coordinates: (latitude: Double, longitude: Double)
}

class MapCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var mountainImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgView.layer.cornerRadius = 20
        self.bgView.clipsToBounds = true
        // Customize cell appearance here
    }
    
   
}

class MapVC: UIViewController {

    @IBOutlet weak var mapCV: UICollectionView!
    let mountainData: [Mountain] = [
        Mountain(name: "Mount Everest",
                 location: "Himalayas, Nepal",
                 itinerary: "Day 1: Kathmandu to Lukla\nDay 2-15: Trek to Everest Base Camp\nDay 16-20: Summit attempt\nDay 21: Return trek to Lukla\nDay 22: Flight back to Kathmandu",
                 transportation: "International flight to Kathmandu, domestic flight to Lukla, trekking to base camp",
                 coordinates: (latitude: 27.9881, longitude: 86.9250)),
        
        Mountain(name: "Kangchenjunga",
                 location: "Himalayas, Nepal/India",
                 itinerary: "Day 1: Kathmandu to Taplejung\nDay 2-20: Trek to Kangchenjunga Base Camp\nDay 21-25: Summit attempt\nDay 26: Return trek to Taplejung\nDay 27: Flight back to Kathmandu",
                 transportation: "International flight to Kathmandu, domestic flight to Taplejung, trekking to base camp",
                 coordinates: (latitude: 27.7025, longitude: 88.1466)),
        
        Mountain(name: "Nanda Devi",
                 location: "Himalayas, India",
                 itinerary: "Itinerary details not available",
                 transportation: "Trekking",
                 coordinates: (latitude: 30.3753, longitude: 79.5928)),
        
        Mountain(name: "Kamet",
                 location: "Himalayas, India",
                 itinerary: "Itinerary details not available",
                 transportation: "Trekking",
                 coordinates: (latitude: 30.9180, longitude: 79.5985)),
        
        Mountain(name: "Saltoro Kangri",
                 location: "Karakoram Range, Pakistan",
                 itinerary: "Itinerary details not available",
                 transportation: "Trekking",
                 coordinates: (latitude: 35.4181, longitude: 76.9694)),
        
        Mountain(name: "Trisul",
                 location: "Himalayas, India",
                 itinerary: "Itinerary details not available",
                 transportation: "Trekking",
                 coordinates: (latitude: 30.5746, longitude: 79.5872)),
        
        Mountain(name: "Dunagiri",
                 location: "Himalayas, India",
                 itinerary: "Itinerary details not available",
                 transportation: "Trekking",
                 coordinates: (latitude: 30.7011, longitude: 79.9597)),
        
        Mountain(name: "Mana Peak",
                 location: "Himalayas, India",
                 itinerary: "Itinerary details not available",
                 transportation: "Trekking",
                 coordinates: (latitude: 30.7342, longitude: 79.0637)),
        
        Mountain(name: "Anamudi",
                 location: "Western Ghats, India",
                 itinerary: "Itinerary details not available",
                 transportation: "Road access to nearest town, trekking",
                 coordinates: (latitude: 10.4605, longitude: 77.0669)),
        
        Mountain(name: "Shivling",
                 location: "Himalayas, India",
                 itinerary: "Itinerary details not available",
                 transportation: "Trekking",
                 coordinates: (latitude: 30.9536, longitude: 79.5941))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Map"
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

extension MapVC : UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mountainData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MapCollectionViewCell", for: indexPath as IndexPath) as! MapCollectionViewCell
               
               // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.nameLbl.text = self.mountainData[indexPath.row].name // The row value is the same as the index of the desired text within the array.
        cell.mountainImg.image = UIImage(named: self.mountainData[indexPath.row].name) // make cell more visible in our example project
               
               return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: mapCV.frame.width/2 - 5, height: mapCV.frame.height/3 - 5)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MapsViewController") as! MapsViewController
        vc.mountain = self.mountainData[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


class MapsViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var itineraryTextView: UILabel!
    @IBOutlet weak var transportationTextView: UILabel!
    @IBOutlet weak var mapView: MKMapView!

    var mountain: Mountain? // Assuming you have a Mountain model

    override func viewDidLoad() {
        super.viewDidLoad()

        // Update UI elements with mountain information
        locationLabel.text = mountain?.location
        itineraryTextView.text = mountain?.itinerary
        transportationTextView.text = mountain?.transportation

        // Set up map view with mountain location
        if let mountainLocation = mountain?.coordinates {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(mountainLocation.latitude,mountainLocation.longitude)
            mapView.addAnnotation(annotation)
//            mapView.setCenter(CLLocationCoordinate2DMake(mountainLocation.latitude,mountainLocation.longitude), animated: true)
            // Define the region to zoom in on
                        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                        let region = MKCoordinateRegion(center: annotation.coordinate, span: span)
                        
                        // Set the region of the map view
                        mapView.setRegion(region, animated: true)
        }
    }
}
