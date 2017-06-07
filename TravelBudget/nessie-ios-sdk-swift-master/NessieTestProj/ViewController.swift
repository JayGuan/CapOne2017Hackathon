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
            
            func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
                
                
                
                let location = locations[0]
                
                let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
                
                let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
                
                let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
                
                print("Latitude: \(myLocation.latitude)")
                
                print("Longitude: \(myLocation.longitude)")
                
            }

    
    func testData() {
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
        let merchant: Merchant = Merchant(merchantId: "57cf75cea73e494d8675ec49",
                                          name: "Best Productions",
                                          category: ["Production"],
                                          address: Address(streetName: "Lafayette St.",
                                                           streetNumber: "5901",
                                                           city: "Brooklyn",
                                                           state: "NY",
                                                           zipCode: "07009"),
                                          geocode: Geocode(lng: -1, lat: 33))
        var latitude = merchant.geocode.lat
        var longitude = merchant.geocode.lng
        print("lat : \(latitude)")
        print("longitude: \(longitude)")
        
    }
    
    @IBAction func testAccountsRequests(sender: AnyObject) {
        print("Hi")
        let _ = AccountTests()
    }
    
    @IBAction func testAtmRequests(sender: AnyObject) {
        let _ = ATMTests()
    }
    
    @IBAction func testBillRequests(sender: AnyObject) {
        let _ = BillTests()
    }
    
    @IBAction func testBranchesRequests(sender: AnyObject) {
        let _ = BranchTests()
    }
    
    @IBAction func testCustomersRequests(sender: AnyObject) {
        let _ = CustomerTests()
    }

    @IBAction func testDepositsRequests(sender: AnyObject) {
        let _ = DepositsTests()
    }
    
    @IBAction func testPurchasesRequests(sender: AnyObject) {
        let _ = PurchasesTests()
    }
    
    @IBAction func testMerchantsRequests(sender: UIButton) {
        let _ = MerchantTests()
    }
    
    @IBAction func testTransfersRequests(sender: AnyObject) {
        let _ = TransfersTests()
    }
    
    @IBAction func testWithdrawalsRequests(sender: UIButton) {
        let _ = WithdrawalsTests()
    }
    
}
