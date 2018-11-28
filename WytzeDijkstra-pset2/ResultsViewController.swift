//
//  ResultsViewController.swift
//  WytzeDijkstra-pset2
//
//  Created by Wytze Dijkstra on 22/11/2018.
//  Copyright © 2018 Wytze Dijkstra. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultTextLabel: UILabel!
    var responses : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTextLabel.text = responses
    }

}
