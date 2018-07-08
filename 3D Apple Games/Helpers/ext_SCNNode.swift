//
//  SCNNodeExtensions.swift
//  3D Apple Games
//
//  Created by pegasus on 2018/07/08.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import SceneKit

extension SCNNode {
    
    // put node with specific geometry at optional position (default = origin)
    public func putGeometry(
        _ geometry:SCNGeometry,
        color: UIColor = .green,
        at point: SCNVector3? = nil
        ) -> SCNNode
    {
        let node = SCNNode(geometry: geometry)
        node.geometry?.materials.first?.diffuse.contents = color   // color
        if let p = point { node.position = p }              // set position if neccesary
        addChildNode(node)
        return node
    }
    
    public func putSampleGeometries() {
        
        // constants
        let w: Float = 0.8
        let w2 = CGFloat(w)
        
        let geo = [
            SCNPlane(width: 8, height: 8),
            SCNBox(width: w2, height: w2, length: w2, chamferRadius: 0),
            SCNSphere(radius: w2/2),
            SCNPyramid(width: w2, height: w2, length: w2),
            SCNCone(topRadius: w2/4, bottomRadius: w2/2, height: w2),
            SCNCylinder(radius: w2/2, height: w2),
            SCNCapsule(capRadius: w2/2, height: w2*2),
            SCNTube(innerRadius: w2/3, outerRadius: w2/2, height: w2),
            SCNTorus(ringRadius: w2, pipeRadius: w2/3)
        ]
        
        let color: [UIColor] = [
            .white, .red, .orange, .yellow, .green,
            .cyan, .blue, .purple, .gray
        ]
        
        let position: [SCNVector3?] = [
            nil, [-3, w/2, 0], [-2, w/2, 0], [-1, 0, 0], [0, w/2 ,0],
            [1,w/2,0], [2,w,0], [3,w/2,0], [0, w, -w*2]
        ]
        
        for i in 0...8 {
            let node = putGeometry(geo[i], color: color[i], at: position[i])
            if i == 0 { // it's a plane, rotate 90 degrees
                // rotation axis: (1,0,0), angle: -pi/2
                node.rotation = SCNVector4(1, 0, 0, -pi/2)
            }
        }
        
    }// end: putSampleGeometries()
    
}// end: extension SCNNode
