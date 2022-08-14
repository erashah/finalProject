//
//  ResourcesViewController.swift
//  connectGitHub
//
//  Created by Era Shah on 8/12/22.
//

import UIKit

class ResourcesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    //actions
    
    @IBAction func buttonFirstLink(_ sender: UIButton) {
        if let url = URL(string: "https://www.health.harvard.edu/blog/anxiety-what-it-is-what-to-do-2018060113955"){
            UIApplication.shared.open(url)
        }
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
