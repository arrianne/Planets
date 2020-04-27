//
//  ViewController.swift
//  Planets
//
//  Created by Arrianne O'shea on 27/04/2020.
//  Copyright © 2020 Arrianne Barker. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    // used to track orientation and position at all times
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

