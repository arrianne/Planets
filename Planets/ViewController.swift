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
       self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
       self.sceneView.session.run(configuration)
           
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let earth = SCNNode()
        let earthDay = #imageLiteral(resourceName: "Earth Day")
        earth.geometry = SCNSphere(radius: 0.2)
        earth.geometry?.firstMaterial?.diffuse.contents = earthDay
        earth.position = SCNVector3(0,0,-1)
        self.sceneView.scene.rootNode.addChildNode(earth)
        // SCNAction is an animation class which will change the structure or display of a node
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 8 )
        
        earth.runAction(action)
        
    }
    
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180}
}
