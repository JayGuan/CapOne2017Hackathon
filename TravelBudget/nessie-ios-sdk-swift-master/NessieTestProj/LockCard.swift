//
//  LockCard.swift
//  Nessie-iOS-Wrapper
//
//  Created by Jay Guan on 6/8/17.
//  Copyright © 2017 Nessie. All rights reserved.
//

import UIKit

class LockCard: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func noClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindSegue", sender: self)
    }
    
    @IBAction func lockClicked(_ sender: UIButton) {
        // alert: are you sure to lock the card
        lockCard()
    }
    
    func lockCard() {
        let alert = UIAlertController(title: "Lock Card", message: "Are you sure to lock the card?", preferredStyle: .alert)
        
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
