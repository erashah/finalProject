//
//  HomePageTableViewController.swift
//  connectGitHub
//
//  Created by Scholar on 8/2/22.
//

import UIKit

class HomePageTableViewController: UITableViewController {
    
   
    
    var situations = [Situation]()
    
    func createSituations() -> [Situation] {

      let stress = Situation(name: "general stress", description: "tips and tricks to deal with everyday stressors", imgName: "generalStressFish.png")
        let unsafe = Situation(name: "unsafe situation", description: "creating a plan of action for an unsafe environment", imgName: "unsafeFish.png")
        let newEnviro = Situation(name: "new environment", description: "how to aquaint yourself in an unfamiliar space", imgName: "newEnvironmentFish.png")
        let nervousAnticipation = Situation(name: "nervous anticipation", description: "affirmations to help build your confidence and calm your nerves", imgName: "bigEventFish.png")
        let panicZone = Situation(name: "panic zone", description: "methods to alleviate stress in extreme conditions", imgName: "panicFish.png")
        //new addition (resources page)
        let resources = Situation(name: "resources", description: "additional resources to help you combat ur anxiety", imgName: "resourceFish.png")
        

      return [stress, unsafe, newEnviro, nervousAnticipation, panicZone, resources]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        situations = createSituations()
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return situations.count

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ContactTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "situationIdentifier", for: indexPath) as! ContactTableViewCell

        // Configure the cell...
        
        let situation = situations[indexPath.row]
        // Configure the cell...
        
        cell.situationName.text = situation.name
    
        cell.preview.text = situation.description
        
        cell.profileImg.image = image(UIImage(named: situation.imgName)!, withSize: CGSize(width: 80, height: 80))

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    // to resize image
    func image( _ image:UIImage, withSize newSize:CGSize) -> UIImage {

        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0,y: 0,width: newSize.width,height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!.withRenderingMode(.automatic)
    }
    
    // goToChatBot
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let situation = situations[indexPath.row]
        //redirecting resources page
        if situation.name == "resources" {
            performSegue(withIdentifier: "resourcesPage", sender: situation)
        }
      // this gives us a single ToDo
        performSegue(withIdentifier: "goToChatBot", sender: situation)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let chatVC = segue.destination as? GeneralChatBotViewController {
            chatVC.situation = sender as! Situation
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
  

}

}
