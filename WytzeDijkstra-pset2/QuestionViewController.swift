//
//  QuestionViewController.swift
//  WytzeDijkstra-pset2
//
//  Created by Wytze Dijkstra on 22/11/2018.
//  Copyright © 2018 Wytze Dijkstra. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var mytext : Story?
    @IBOutlet weak var fillInWordsStackView: UIStackView!
    @IBOutlet weak var wordtypeLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var wordCountLabel: UILabel!
    @IBAction func textButtonPressed(_ sender: UIButton) {
        mytext?.fillInPlaceholder(word: textField.text!)
        if mytext?.isFilledIn == true {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        } else {
            fillinwords(using: mytext!)
        }
    }
    
    @IBOutlet weak var chooseStoryStackView: UIStackView!
    @IBAction func simpleButtonPressed(_ sender: UIButton) {
        let storyPath = Bundle.main.path(forResource: "madlib0_simple", ofType: "txt")
        let text = try! String(contentsOfFile: storyPath!, encoding: .utf8)
        mytext = Story(withText: text)
        fillinwords(using: mytext!)
    }
    @IBAction func tarzanButtonPressed(_ sender: UIButton) {
        let storyPath = Bundle.main.path(forResource: "madlib1_tarzan", ofType: "txt")
        let text = try! String(contentsOfFile: storyPath!, encoding: .utf8)
        mytext = Story(withText: text)
        fillinwords(using: mytext!)
    }
    @IBAction func universityButtonPressed(_ sender: UIButton) {
        let storyPath = Bundle.main.path(forResource: "madlib2_university", ofType: "txt")
        let text = try! String(contentsOfFile: storyPath!, encoding: .utf8)
        mytext = Story(withText: text)
        fillinwords(using: mytext!)
    }
    @IBAction func clothesButtonPressed(_ sender: UIButton) {
        let storyPath = Bundle.main.path(forResource: "madlib3_clothes", ofType: "txt")
        let text = try! String(contentsOfFile: storyPath!, encoding: .utf8)
        mytext = Story(withText: text)
        fillinwords(using: mytext!)
    }
    @IBAction func danceButtonPressed(_ sender: UIButton) {
        let storyPath = Bundle.main.path(forResource: "madlib4_dance", ofType: "txt")
        let text = try! String(contentsOfFile: storyPath!, encoding: .utf8)
        mytext = Story(withText: text)
        fillinwords(using: mytext!)
        
    }
    
    
    func fillinwords (using textsort : Story) {
        chooseStoryStackView.isHidden = true
        fillInWordsStackView.isHidden = false
        textField.text = ""
        let theString = "Please type a \(textsort.nextPlaceholder!)" as NSString
        let theAttributedString = NSMutableAttributedString(string: theString as String)
        let boldString = "\(textsort.nextPlaceholder!)"
        let boldRange = theString.range(of: boldString)
        let font = UIFont.boldSystemFont(ofSize: 17)
        theAttributedString.addAttribute(NSAttributedString.Key.font, value: font, range: boldRange)
        wordtypeLabel.attributedText = theAttributedString
        wordCountLabel.text = "\(textsort.remainingPlaceholders) word(s) left"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillInWordsStackView.isHidden = true
        chooseStoryStackView.isHidden = false
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = mytext?.normalText
        }
    }

}
