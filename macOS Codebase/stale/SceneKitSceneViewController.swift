//
//  SceneKitSceneViewController.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 6/10/17.
//

import Cocoa
import SceneKit
import SpriteKit

class SceneKitSceneViewController: NSViewController {

    @IBOutlet weak var sceneView: SCNView!
    var scene: SCNScene!
    @IBOutlet weak var box: NSBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.allowsCameraControl = true
        sceneView.gestureRecognizers.append(NSClickGestureRecognizer(target: self, action: #selector(sceneClicked)))
        sceneView.gestureRecognizers.append(NSPanGestureRecognizer(target: self, action: #selector(panning)))
        scene = sceneView.scene!
        
        let grid = Grid()
        scene.rootNode.addChildNode(grid.node)
    }
    
    override func viewDidAppear() {
        view.window?.title = "Life Calendar"
    }
    
    @objc func panning(gestureRecognizer: NSGestureRecognizer) {
        let location = gestureRecognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(location, options: nil)
        
        if hitResults.count > 0 {
            let result = hitResults[0]
            let node = result.node
            
            node.geometry?.firstMaterial?.diffuse.contents = NSColor.green
        }
    }
    
    @objc func sceneClicked(gestureRecognizer: NSGestureRecognizer) {
        let location = gestureRecognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(location, options: nil)
        
        if hitResults.count > 0 {
            let result = hitResults[0]
            let node = result.node
            
            node.geometry?.firstMaterial?.diffuse.contents = NSColor.blue
        }
    }
    
}