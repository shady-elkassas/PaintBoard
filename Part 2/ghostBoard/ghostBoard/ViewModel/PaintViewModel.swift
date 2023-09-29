//
//  PaintViewModel.swift
//  ghostBoard
//
//  Created by Shady Elkassas on 27/09/2023.
//

import Foundation

class PaintViewModel: ObservableObject{
    
    @Published var lines: [Line] = []
    
    
    func addLine(color: String, points: [CGPoint]){
        
        
        let tempLine = Line(color: color,  points: points)
        
        DispatchQueue.main.async { [weak self] in
            self?.lines.append(tempLine)
        }
        
        
    }
    
}
