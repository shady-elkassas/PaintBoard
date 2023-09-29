//
//  Line.swift
//  ghostBoard
//
//  Created by Shady Elkassas on 27/09/2023.
//

import Foundation

//Line Model
struct Line:Identifiable{
    
    var id = UUID()
    var color: String
    var points:[CGPoint] = []
    
}
