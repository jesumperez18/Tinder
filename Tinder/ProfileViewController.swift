//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Jesus perez on 3/28/18.
//  Copyright © 2018 Jesus perez. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    

    
    @IBOutlet weak var navBar: UIImageView!
    @IBOutlet weak var profileViewImage: UIImageView!
   // var x : CardsViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navBar.image = #imageLiteral(resourceName: "nav_bar2")
       profileViewImage.image = #imageLiteral(resourceName: "ryan")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
