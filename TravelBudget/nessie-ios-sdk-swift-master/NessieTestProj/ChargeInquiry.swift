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
    
    
    
    var userLat = 37.543499
    var userLong = -77.436787
    var purchaseLat = 37.443499
    var purchaseLong = -77.436787
    var location: (Double,Double)? = nil
    var city = ""
    var date:Date? = nil
    var type = ""
    var amount = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        super.viewDidLoad()
        displayData()
        let initialLocation = CLLocation(latitude: (userLat + purchaseLat) / 2.0, longitude: (userLong + purchaseLong) / 2.0)
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let userannotation = MKPointAnnotation()
        
        let userCoordinate = CLLocationCoordinate2D(latitude: userLat, longitude: userLong)
        
        userannotation.coordinate = userCoordinate
        
        userannotation.title = "Your Location"
        
        
        
        
        
        mapView.addAnnotation(userannotation)
        
        
        
        let purchaseannotation = MKPointAnnotation()
        
        let purchaseCoordinate = CLLocationCoordinate2D(latitude: purchaseLat, longitude: purchaseLong)
        
        
        
        
        
        purchaseannotation.coordinate = purchaseCoordinate
        
        purchaseannotation.title = "Purchase Location"
        
        
        
        
        
        
        
        mapView.addAnnotation(purchaseannotation)
        
        
        
        
        
        //centerMapOnLocation(location:initialLocation)
        
        self.mapView.showAnnotations(self.mapView.annotations, animated: true)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
