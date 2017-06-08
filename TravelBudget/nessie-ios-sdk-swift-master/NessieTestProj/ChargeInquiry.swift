//
//  ChargeInquiry.swift
//  Nessie-iOS-Wrapper
//
//  Created by Guillermo Rojas Hernandez on 6/7/17.
//  Copyright © 2017 Nessie. All rights reserved.
//

import UIKit
import MapKit

class ChargeInquiry: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let userLat = 37.543499
        
        let userLong = -77.436787
        
        
        
        let purchaseLat = 37.443499
        
        let purchaseLong = -77.436787
        
        
        
        super.viewDidLoad()
        
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
