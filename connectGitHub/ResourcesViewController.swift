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
    
    //done button
    
    @IBAction func buttonDoneClose(_ sender: UIButton) {
        if((self.presentingViewController) != nil){
            self.dismiss(animated: false, completion: nil)
          }
    }
    
    @IBAction func buttonFirstLink(_ sender: UIButton) {
        if let url = URL(string: "https://www.health.harvard.edu/blog/anxiety-what-it-is-what-to-do-2018060113955"){
            UIApplication.shared.open(url)
        }
    }
    
    
    @IBAction func buttonHopkinsLink(_ sender: UIButton) {
        if let url = URL(string: "https://www.hopkinsmedicine.org/health/treatment-tests-and-therapies/how-to-help-someone-with-anxiety"){
            UIApplication.shared.open(url)
        }
    }
    
    
    @IBAction func buttonMayoLink(_ sender: UIButton) {
        if let url = URL(string: "https://www.mayoclinichealthsystem.org/hometown-health/speaking-of-health/11-tips-for-coping-with-an-anxiety-disorder"){
            UIApplication.shared.open(url)
        }
    }
    
    
    @IBAction func buttonClevelandLink(_ sender: UIButton) {
        if let url = URL(string: "https://my.clevelandclinic.org/health/diseases/9536-anxiety-disorders"){
            UIApplication.shared.open(url)
        }
    }
    
    
    @IBAction func buttonYaleLink(_ sender: UIButton) {
        if let url = URL(string: "https://medicine.yale.edu/news-article/safety-signals-may-help-slow-down-anxiety/"){
            UIApplication.shared.open(url)
        }
    }
    
    
    @IBAction func buttonADAALink(_ sender: UIButton) {
        if let url = URL(string: "https://adaa.org/tips"){
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
