//
//  GameViewController.swift
//  3D Apple Games
//
//  Created by pegasus on 2018/07/08.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    var scene: SCNScene!
    var sceneView: SCNView!
    
    override func loadView() {
        
        // create a scene view
        sceneView = SCNView()
        sceneView.backgroundColor = #colorLiteral(red: 0.062745101749897, green: 0.0, blue: 0.192156866192818, alpha: 1.0)
        
        // allows the user to manipulate the camera
        sceneView.allowsCameraControl = true
        
        // default lighting
//        sceneView.autoenablesDefaultLighting = true
        
        // show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // set scene view as the controller's main view
        view = sceneView
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // create and figure scene
        setupScene()
        setupCamera()
        letThereBeLights()
    }
    
    func setupScene() {
        scene = SCNScene()
        sceneView.scene = scene
        scene.rootNode.putSampleGeometries()
    }
    
    func setupCamera() {
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        // place the camera
        cameraNode.position = [0, 0, 15]
    }
    
    func letThereBeLights() {
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = [0, 10, 10]
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
    }
    
    // MARK: - View Controller Properties
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

}// end: GameViewController
