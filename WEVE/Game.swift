//
//  Game.swift
//  Hackathon
//
//  Created by Seungwon An on 4/22/22.
//

import Foundation
import SwiftUI

struct Game : Hashable, Codable, Identifiable{
    
    var name : String
    var id : Int
    
    private var imageName: String
        var image: Image {
            Image(imageName)
        }
}
