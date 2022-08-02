//
//  GeneralChatBotViewController.swift
//  connectGitHub
//
//  Created by Scholar on 8/2/22.
//

import UIKit

class GeneralChatBotViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var situation = Situation(name: "stress", description: "", imgName: "")
    var stage = 0
    
    //outlets
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textInput: UITextField!
    
    var messages = [Message]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        stage = 0
        
        if(situation.name.count > 0) {
            print(situation.name)
            printMessages()
        }

        // Do any additional setup after loading the view.
    }
    
    var situationResponses = [
        "general stress": [
            [Message(ifBot: true, text:"let's do a breathing exercise"),
            ],
            [Message(ifBot: true, text:"this \n is \n a \n test \n yay \n !")]
        ]
//             "inhale:"],
//            ["hold your breath: ", "1"]
//         ],
//
//        "unsafe": [
//            ["how unsafe do you feel on a scale of 1-10?"],
//            ["Let's make a plan of action.", "Can you remove yourself from the situation? Respond with 'yes' or 'no'"],
//            ["keep going"]
//        ]
    ]
    
    
    func printMessages() {
        if(stage < situationResponses[situation.name]!.count) {
            for msg in situationResponses[situation.name]![stage] {
                messages.append(msg)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @IBAction func sendButton(_ sender: Any) {
        messages.append(Message(ifBot: false, text: textInput.text!))
        stage = stage + 1
        printMessages()
        self.tableView.reloadData()
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    // number of rows in table view
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.messages.count
        }
    
    
        
        // create a cell for each table view row
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            // create a new cell if needed or reuse an old one
            let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: "recieveTextIdentifier") as UITableViewCell?)!
            
            // set the text from the data model
            let message = self.messages[indexPath.row]
            cell.textLabel?.numberOfLines = 0
            if(message.ifBot) {
                cell.textLabel?.text = "! \(message.text)"
                cell.backgroundView = UIImageView(image: UIImage(named: "greyBubbleLeft.png")!)
            }
            else {
                cell.textLabel?.text = message.text
                cell.backgroundView = UIImageView(image: UIImage(named: "blueMessage.png")!)
            }
            
            
            return cell
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
