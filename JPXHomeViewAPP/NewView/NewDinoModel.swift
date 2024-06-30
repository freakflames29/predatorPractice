//
//  NewDinoModel.swift
//  JPXHomeViewAPP
//
//  Created by sourav das on 29/06/24.
//

import Foundation
import SwiftUI

struct NewDinoModel: Decodable, Identifiable {
    let id : Int
    let name : String
    let type : NewDinoType
    let latitude : Double
    let longitude : Double
    let movies : [String]
    let link : String
    let movieScenes : [MovieScenes]
    
    
    var img : String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
        
    }
    
    
    
    // Movie scenes struct
    struct MovieScenes: Decodable, Identifiable {
        let id : Int
        let movie : String
        let sceneDescription : String
    }
    
    enum NewDinoType : String ,Decodable,CaseIterable {
        case all
        case land
        case air
        case sea
        
        var backgroundColor : Color {
            switch self {
                case .all:
                        .red
                case .land:
                        .brown
                case .air:
                        .teal
                case .sea:
                        .blue
            }
        }
        
        var icons : String {
            switch self {
                case .all:
                    "square.stack.3d.up.fill"
                case .air:
                    "wind"
                case .land:
                    "leaf.fill"
                case .sea:
                        "drop.fill"
                    
            }
        }
    }
}
