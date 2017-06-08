//
//  ChargeInquiry.swift
//  Nessie-iOS-Wrapper
//
//  Created by Guillermo Rojas Hernandez on 6/7/17.
//  Copyright © 2017 Nessie. All rights reserved.
//

import UIKit
import MapKit
import NessieFmwk

class ChargeInquiry: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    
    
    var userLat = 0.0
    var userLong = 0.0
    var purchaseLat = 40.724860
    var purchaseLong = -73.991654
    var location: (Double,Double)? = nil
    var city = ""
    var date:Date? = nil
    var type = ""
    var amount = 0.0
    var cardOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Charge Inquiry"
        
        super.viewDidLoad()
        displayData()
        let initialLocation = CLLocation(latitude: (userLat + purchaseLat) / 2.0, longitude: (userLong + purchaseLong) / 2.0)
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        
        
        let purchaseannotation = MKPointAnnotation()
        
        let purchaseCoordinate = CLLocationCoordinate2D(latitude: purchaseLat, longitude: purchaseLong)
        
        
        
        
        
        purchaseannotation.coordinate = purchaseCoordinate
        
        purchaseannotation.title = "Purchase Location"
        
        
        
        
        
        
        
        mapView.addAnnotation(purchaseannotation)
        
        let userannotation = MKPointAnnotation()
        
        let userCoordinate = CLLocationCoordinate2D(latitude: userLat, longitude: userLong)
        
        userannotation.coordinate = userCoordinate
        
        userannotation.title = "Your Location"
        
        
        
        
        
        mapView.addAnnotation(userannotation)
        
        
        
        
        
        //centerMapOnLocation(location:initialLocation)
        
        self.mapView.showAnnotations(self.mapView.annotations, animated: true)
        mapView.selectAnnotation(mapView.annotations[1], animated: true)
    }
    
    func displayData() {
        cityLabel.text = city
        amountLabel.text = String(amount)
        typeLabel.text = type
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.setLocalizedDateFormatFromTemplate("dd.MM.yyyy HH:mm")
        dateLabel.text = dateFormatter.string(from: date!)
    }
    
    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLocation(location: CLLocation) {
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  
                                                                  regionRadius * 13.0, regionRadius * 15.0)
        
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func crossButtonClicked(_ sender: UIButton) {
        lockCard()
    }
    
    func lockCard() {
        let alert = UIAlertController(title: "Lock Card", message: "Do you want to lock the card?", preferredStyle: .alert)
        
        let no = UIAlertAction(title: "No", style: .default, handler:
        {
            (alert: UIAlertAction!) in self.NoHandler()
        })
        
        let yes = UIAlertAction(title: "Yes", style: .default, handler:
        {
            (alert: UIAlertAction!) in self.YesHandler()
        })
        
        
        alert.addAction(no)
        alert.addAction(yes)
        
        present(alert, animated: true, completion: nil)
    }
    
    func NoHandler() {
        
    }
    func YesHandler() {
        print("card locked")
        cardOn = false
        performSegue(withIdentifier: "unwindSegue", sender: self)
    }
    
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        print("unwind")
        let alert = UIAlertController(title: "Transaction Approved", message: "You have approved this transaction", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default, handler:
        {
            (alert: UIAlertAction!) in self.OkHandler()
        })
        
        
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
        
    }
    
    func OkHandler() {
        performSegue(withIdentifier: "unwindSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // parepare for next scene
        if segue.identifier == "unwindSegue" {
            
            if let dvc = segue.destination as? ViewController {
                // use variables from purchase1 if created, instead of hard coded value
                dvc.cardOn = self.cardOn
            }
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
