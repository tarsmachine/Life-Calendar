//
//  Grid.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/27/17.
//

import Cocoa
import SpriteKit

class GridNode: SKNode {
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

struct Grid {
    
    let ultimateSize = CGSize(width: 330, height: 574)
    private var currentTilePopup = TilePopup()
    let node: SKNode!
    
    init() {
        node = SKNode()
        node.isUserInteractionEnabled = true
        createGridOfTiles(rows: 90, columns: 52)
    }
    
//    override func mouseMoved(with event: NSEvent) {
//        print("Grid - mouse moved: \(event.location(in: self))")
//        currentTilePopup.removeFromParent()
//
//        let nodes = self.nodes(at: event.location(in: self))
//
//        for node in nodes {
//            if let tile = node as? Tile {
//
//                tile.node?.addChild(currentTilePopup)
//            }
//        }
//
//    }
    
    private func createGridOfTiles(rows: Int, columns: Int) {
        let padding = 2
        let tileSize = 4
        
        for rowNumber in 0...rows {
            for columnNumber in 0...columns {
                let x = (tileSize + padding) * columnNumber
                let y = (tileSize + padding) * rowNumber * -1
                
                addTile(at: CGPoint(x: x, y: y))
            }
        }
    }
    
    func addTile(at position: CGPoint) {
        let tile = Tile()
        
        tile.node.position = position
        
        node.addChild(tile.node)
    }
    
}
