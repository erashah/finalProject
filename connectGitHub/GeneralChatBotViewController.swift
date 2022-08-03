//
//  GeneralChatBotViewController.swift
//  connectGitHub
//
//  Created by Scholar on 8/2/22.
//

import UIKit

class GeneralChatBotViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var situationName: UILabel!
    
    var situation = Situation(name: "", description: "", imgName: "")
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

        
        
        // if there is a situation (if it loaded)
        if(situation.name.count > 0) {
            print(situation.name)
            // SET LABEL TO SITUATION NAME + >
            situationName.text = situation.name + " >"
            
            
            printMessages()
        }
        
        addNavBarImage()

        // Do any additional setup after loading the view.
    }
    
    var situationResponses = [
        "general stress": [
            [Message(ifBot: true, text:"what is making you anxious?"),
            ],
            [Message(ifBot: true, text: "why is this making you anxious?")],
            
            [Message(ifBot: true, text: "let's do a breathing exercise! ready?")],
            [Message(ifBot: true, text: "put one hand on your stomach and the other on your chest.")],
            [Message(ifBot: true, text:"inhale through your nose for 4 seconds:", delayed: 4)],
            [Message(ifBot: true, text:"hold your breath for 7 seconds:", delayed: 7)],
            [Message(ifBot: true, text:"exhale through your mouth for 8 seconds:", delayed: 8)],
            
        ],
        
        "unsafe situation": [
            [Message(ifBot: true, text:"assess your surroundings. do you want to create a plan of action?")],
            [Message(ifBot: true, text:"text back where the exits are.")],
            [Message(ifBot: true, text:"share your location with a trusted individual. text back when completed.")],
            [Message(ifBot: true, text:"always remember, stay calm, cautios, and alert.")],
            [Message(ifBot: true, text:"if necessary, create a scene to attract attention of others in the area or call law enforcement.")],
           
        ],
        
        "new environment": [
            [Message(ifBot: true, text:"remember that the people you are meeting are just ordinary people, just like you. they're probably nervous too!")],
            [Message(ifBot: true, text:"let's start a mock conversation to practice your social skills.")],
            [Message(ifBot: true, text:"hi, i'm TheraFish. what's your name?")],
            [Message(ifBot: true, text:"'say a compliment.'")],
            [Message(ifBot: true, text:"thank you! where are you from?")],
            [Message(ifBot: true, text:"do you have any siblings or pets? i have 50 fish siblings!")],
            [Message(ifBot: true, text:"i love swimming with my siblings. do you play any sports?")],
            [Message(ifBot: true, text:"'complain about something relatable that you have in common, like the weather or how you're feeling.'")]
        ],
        
        "nervous anticipation": [
            [Message(ifBot: true, text:"everything will turn out okay. \n let's start a relaxtion technique!")],
            [Message(ifBot: true, text:"text back 3 sounds you hear.")],
            [Message(ifBot: true, text:"text back and move 3 parts of your body.")],
            [Message(ifBot: true, text:"text back 3 things you see.")],
            [Message(ifBot: true, text:"let's repeat some positive affirmations.")],
            [Message(ifBot: true, text:"text back these affirmations while repeating them to yourself.")],
            [Message(ifBot: true, text:"everything is happening for my ultimate good.")],
            [Message(ifBot: true, text:"as i breathe, i am calm and relaxed.")],
            [Message(ifBot: true, text:"i can move past this moment.")],
            [Message(ifBot: true, text:"i can handle anything that comes my way.")],
            [Message(ifBot: true, text:"i have the strength and confidence needed to succeed.")],
            ],
        
        "panic zone": [
            [Message(ifBot: true, text:"take some deep breaths, in and out."),
            ],
            [Message(ifBot: true, text:"now, we'll begin some progressive muscle relaxation.")],
            [Message(ifBot: true, text:"let's start with arms and hands.")],
        ],
    
    ]
            
        
        
        
        
        
    
    func scrollToBottom() {
        if messages.count != 0 {
            if(messages.count == 1) {
                let indexPath = IndexPath(row: 0 , section: 0)
                tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.middle, animated: true)
            }
            else {
                let indexPath = IndexPath(row: messages.count-2 , section: 0)
                tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.middle, animated: true)
            }
            
        }
        
    }
    
    func addCountdown(second: Int) {
        var countdown = Message(ifBot: true, text: "\(second)...")
        messages.append(countdown)
        tableView.reloadData()
        scrollToBottom()
        if(second != 1) {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                self.addCountdown(second: second - 1)
                print("done")
            })
        }
    }
    
    func printMessages() {
        if(stage < situationResponses[situation.name]!.count) {
            for msg in situationResponses[situation.name]![stage] {
                messages.append(msg)
                tableView.reloadData()
                scrollToBottom()
                if(msg.delayed > 0) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                        self.addCountdown(second: msg.delayed)
                        print("done")
                    })
                }
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 // row height
    }
    
    func addNavBarImage() {
            let navController = navigationController!
        let image = UIImage(named: situation.imgName) //Your logo url here
            let imageView = UIImageView(image: image)
            let bannerWidth = navController.navigationBar.frame.size.width
            let bannerHeight = navController.navigationBar.frame.size.height
            let bannerX = bannerWidth / 2 - (image?.size.width)! / 2
            let bannerY = bannerHeight / 2 - (image?.size.height)! / 2
            imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
            imageView.contentMode = .scaleAspectFit
            navigationItem.titleView = imageView
    }

    @IBAction func sendButton(_ sender: Any) {
        messages.append(Message(ifBot: false, text: textInput.text!))
        scrollToBottom()
        stage = stage + 1
        printMessages()
        tableView.reloadData()
        textInput.text = ""
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
            
            
            
            // set the text from the data model
            let message = self.messages[indexPath.row]
            
            if(message.ifBot) {
                // create a new cell if needed or reuse an old one
                let cell = (tableView.dequeueReusableCell(withIdentifier: "recieveTextIdentifier") as! GreyTableViewCell?)!
                cell.messageText.text = message.text
//                cell.textLabel?.numberOfLines = 0
                
                return cell
//                cell.backgroundView = UIImageView(image: UIImage(named: "greyBubbleLeft.png")!)
            }
            let cell = (tableView.dequeueReusableCell(withIdentifier: "sendTextIdentifier") as! BlueTableViewCell?)!
//            cell.textLabel?.numberOfLines = 0
            cell.messageText.text = message.text
//                cell.backgroundView = UIImageView(image: UIImage(named: "blueMessage.png")!)
            
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
