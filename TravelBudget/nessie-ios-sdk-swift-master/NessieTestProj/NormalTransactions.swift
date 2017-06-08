//
//  NormalTransactions.swift
//  Nessie-iOS-Wrapper
//
//  Created by Guillermo Rojas Hernandez on 6/7/17.
//  Copyright © 2017 Nessie. All rights reserved.
//

import UIKit

class NormalTransactions: UIViewController {

    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    var city = ""
    var date:Date? = nil
    var type = ""
    var amount = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
