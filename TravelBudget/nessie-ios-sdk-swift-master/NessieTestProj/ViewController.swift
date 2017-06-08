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
import UserNotifications

class ViewController: UIViewController,CLLocationManagerDelegate {
    var customer1:Customer? = nil
    var purchase1:Purchase? = nil
    var currentLocation: (Double, Double)? = nil
    var cardOn = true
    
    @IBOutlet weak var background: UIImageView!
    let nearbyNotification = Notification.Name(rawValue:"nearbyNotification")
    
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
       self.title = "Wallet"
        /*
        let nc = NotificationCenter.default
        nc.addObserver(forName:nearbyNotification, object:nil, queue:nil, using:catchNotification(notification:))
 */
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        manager.delegate = self
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        self.title = "Wallet"
        if cardOn == false {
            background.image = UIImage(named: "lock")
            let alert = UIAlertController(title: "Action Required", message: "Please contact 1-800-CAPITAL (1-800-227-4825)", preferredStyle: .alert)
            
            let myAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(myAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    @available(iOS 10.0, *)
    func notification() {
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Charging Inquiry!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Action Required!", arguments: nil)
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // create the request object
        let request = UNNotificationRequest(identifier: "5 seconds", content: content, trigger: trigger)
        // ebale or disable features based on authorization
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound], completionHandler: {didAllow, error in})
        center.add(request, withCompletionHandler: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let nc = NotificationCenter.default
        nc.post(name:nearbyNotification,
                object: nil,
                userInfo:["message":"Hello there!", "date":Date()])
    }
    
    func catchNotification(notification:Notification) -> Void {
        print("Catch notification")
        
        guard let userInfo = notification.userInfo,
            let message  = userInfo["message"] as? String,
            let date     = userInfo["date"]    as? Date else {
                print("No userInfo found in notification")
                return
        }
        
        let alert = UIAlertController(title: "Notification!",
                                      message:"\(message) received at \(date)",
            preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
                
        print("Latitude: \(myLocation.latitude)")
        print("Longitude: \(myLocation.longitude)")
        currentLocation = (myLocation.latitude, myLocation.longitude)
        print("current location assigned \(currentLocation)")
                
    }

    //Called on view open
    func testDataNear() {
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

        
        var latitudeNear = merchantNear.geocode.lat
        var longitudeNear = merchantNear.geocode.lng
        print("lat Near : \(latitudeNear)")
        print("longitude Near: \(longitudeNear)")
        
        print("START HERE")
        print(verified(location: (latitudeNear,longitudeNear)))
    }
    
    //Called on view open
    func testDataFar() {
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

        let merchantFar: Merchant = Merchant(merchantId: "57cf75cea73e494d8675ec49",
                                             name: "Ko",
                                             category: ["Contemporary American"],
                                             address: Address(streetName: "Extra Place",
                                                              streetNumber: "8",
                                                              city: "New York",
                                                              state: "NY",
                                                              zipCode: "10003"),
                                             geocode: Geocode(lng: -73.991654, lat: 40.724860))
        var latitudeFar = merchantFar.geocode.lat
        var longitudeFar = merchantFar.geocode.lng
        print("lat Far: \(latitudeFar)")
        print("longitude Far: \(longitudeFar)")
        
        print("START HERE")
        print(verified(location: (latitudeFar,longitudeFar)))
        
        // create a purchase here
    }
    
    func verified (location: (NSNumber, NSNumber)) -> Bool {
        var lat = Double(location.0)
        var long = Double(location.1)
        print("verified")
        print(";lat: \(lat)")
        print("long \(long)")
        print("current location in verified: (currentLocation)")
        if let currentLocation = self.currentLocation {
            print("enter if let")
            if (currentLocation.0 - lat > 1 || currentLocation.0 - lat < -1) {
                return false
            }
            else if (currentLocation.1 - long > 1 || currentLocation.1 - long < -1) {
                return false
            }
            else {
            return true
            }
        }
        else {
            return false
            print("current location not available")
        }
        return false
    }
    
    @available(iOS 10.0, *)
    @IBAction func nearbyTransClicked(_ sender: UIButton) {
        if cardOn {
            performSegue(withIdentifier: "nearby", sender: self)
            testDataNear()
            notification()
        }
        else {
            print("todo alert transaction")
            let alert = UIAlertController(title: "Transaction Cancelled", message: "Your card is locked", preferredStyle: .alert)
            
            let myAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(myAction)
            
            present(alert, animated: true, completion: nil)
        }

    }

    
    @IBAction func suspiciousButtonClicked(_ sender: UIButton) {
        //let _ = PurchasesTests()
        if cardOn {
            performSegue(withIdentifier: "distant", sender: self)
            testDataFar()
        }
        else {
            print("todo")
            let alert = UIAlertController(title: "Transaction Cancelled", message: "Your card is locked", preferredStyle: .alert)
            
            let myAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(myAction)
            
            present(alert, animated: true, completion: nil)

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // parepare for next scene
        if segue.identifier == "distant" {
            
            if let dvc = segue.destination as? ChargeInquiry {
                // use variables from purchase1 if created, instead of hard coded value
                dvc.amount = 143.4
                dvc.city = "NY"
                dvc.date = Date.init()
                dvc.type = "Grocery"
                dvc.userLat = (currentLocation?.0)!
                dvc.userLong = (currentLocation?.1)!
            }
        }
        else if segue.identifier == "nearby" {
            if let dvc = segue.destination as? NormalTransactions {
                // use variables from purchase1 if created, instead of hard coded value
                dvc.amount = 175.5
                dvc.city = "Richmond"
                dvc.date = Date.init()
                dvc.type = "Food"
            }
        }
    }
    
}
