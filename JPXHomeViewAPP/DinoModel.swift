//
//  DinoModel.swift
//  JPXHomeViewAPP
//
//  Created by sourav das on 28/06/24.
//

import Foundation
import SwiftUI

struct DinoModel : Decodable,Identifiable {
    let id : Int
    let name : String
    let type : dinoType
    let latitude : Double
    let longitude : Double
    let movies : [String]
    let link : String
    let movieScenes : [MovieScenes]
    
    
    var img : String {
        
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    
    struct MovieScenes: Decodable,Identifiable{
        let id: Int
        let movie : String
        let sceneDescription : String
    }
    
    enum dinoType : String,Decodable,CaseIterable {
        case all
        case land // rawValue = land
        case air // rawValue = air
        case sea // rawValue = sea
        
//        var id : dinoType {self}
        
        var pillColor : Color {
            switch self {
                case .land:
                        .brown
                case .air:
                        .teal
                case .sea:
                        .blue
                case .all :
                        .red
            }
        }
        
        var icon : String {
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
