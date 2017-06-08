//
//  ViewController.swift
//  NessieTestProj
//
//  Created by Lopez Vargas, Victor R. on 10/5/15.
//  Copyright (c) 2015 Nessie. All rights reserved.
//

import UIKit
import NessieFmwk
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    var customer1:Customer? = nil
    var purchase1:Purchase? = nil
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        testData()
        
        
    }
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
                
        print("Latitude: \(myLocation.latitude)")
        print("Longitude: \(myLocation.longitude)")
        
        
                
    }

    //Called on view open
    func testData() {
        //Personal contact information
        var address1 = Address.init(streetName: "Capital One Dr", streetNumber: "15054", city: "Richmond", state: "VA", zipCode: "23229")
        customer1 = Customer.init(firstName: "Kyle", lastName: "Guan", address: address1, customerId: "1")
        
        let client = NSEClient.sharedInstance
        var account: Account = Account(accountId: "57d32a5ce63c5995587e85ec",
                                       accountType:.CreditCard,
                                       nickname: "Hola",
                                       rewards: 10,
                                       balance: 100,
                                       accountNumber: "1234567890123456",
                                       customerId: "57d0c20d1fd43e204dd48282")
        let merchantNear: Merchant = Merchant(merchantId: "1000",
                                          name: "La Grotta Ristorante",
                                          category: ["Restaurant"],
                                          address: Address(streetName: "East Broad Street",
                                                           streetNumber: "529",
                                                           city: "Richmond",
                                                           state: "VA",
                                                           zipCode: "23219"),

                                          geocode: Geocode(lng: -77.437291, lat: 37.542430))
        
        let merchantFar: Merchant = Merchant(merchantId: "57cf75cea73e494d8675ec49",
                                          name: "Ko",
                                          category: ["Contemporary American"],
                                          address: Address(streetName: "Extra Place",
                                                           streetNumber: "8",
                                                           city: "New York",
                                                           state: "NY",
                                                           zipCode: "10003"),
                                          geocode: Geocode(lng: -73.991654, lat: 40.724860))
        
        var latitudeNear = merchantNear.geocode.lat
        var longitudeNear = merchantNear.geocode.lng
        print("lat Near : \(latitudeNear)")
        print("longitude Near: \(longitudeNear)")
        
        var latitudeFar = merchantFar.geocode.lat
        var longitudeFar = merchantFar.geocode.lng
        print("lat Far: \(latitudeFar)")
        print("longitude Far: \(longitudeFar)")
    }
    
    @IBAction func nearbyTransClicked(_ sender: UIButton) {
       
    }

    
    @IBAction func suspiciousButtonClicked(_ sender: UIButton) {
        let _ = PurchasesTests()
    }
    
}
