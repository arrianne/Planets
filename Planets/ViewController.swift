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
        
        // the only way for specular to work is with a light source
        self.sceneView.autoenablesDefaultLighting = true
           
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let earth = SCNNode()
        let earthDay = #imageLiteral(resourceName: "Earth Day")
        let earthSpecular = #imageLiteral(resourceName: "Earth Specular")
        let earthEmission = #imageLiteral(resourceName: "Earth Emission")
        let earthNormal = #imageLiteral(resourceName: "Earth Normal")
        
        earth.geometry = SCNSphere(radius: 0.2)
        earth.geometry?.firstMaterial?.diffuse.contents = earthDay
        // Adds reflection - onlu to water
        earth.geometry?.firstMaterial?.specular.contents = earthSpecular
        // Adds addition clouds on top
        earth.geometry?.firstMaterial?.emission.contents = earthEmission
        // Adds 3 dimensional detail to node
        earth.geometry?.firstMaterial?.normal.contents = earthNormal
        earth.position = SCNVector3(0,0,-1)
        self.sceneView.scene.rootNode.addChildNode(earth)
        
        // SCNAction is an animation class which will change the structure or display of a node
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 8 )
        
        let forever = SCNAction.repeatForever(action)
        
        earth.runAction(forever)
        
    }
    
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180}
}
