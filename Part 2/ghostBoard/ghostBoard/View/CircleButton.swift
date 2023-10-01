//
//  CustomCircle.swift
//  ghostBoard
//
//  Created by Shady Elkassas on 27/09/2023.
//

import SwiftUI

//Custom circle button view
struct CircleButton: View{
    
    //variables
    var color: String
    
    //Binding variable
    @Binding var selectedColor: String
    
    var body: some View {
        
        let colorName = getColorFromName(color)
        
        Circle()
            .frame(width: 60, height: 60)
            .foregroundColor(colorName)
            .padding(5)
            .overlay(
                Circle()
                    .stroke(selectedColor == color ? Color.black : Color.clear, lineWidth: selectedColor == color ? 4 : 0)
            )
            .cornerRadius(100)
            .onTapGesture {
                selectedColor = color
            }
        
        
    }
    
    // Helper function to convert color name to Color
    private func getColorFromName(_ colorName: String) -> Color {
        switch colorName {
        case "Red":
            return .red
        case "Blue":
            return .blue
        case "Green":
            return .green
        case "Eraser":
            return .gray
        default:
            return .white
        }
    }
    
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(color: "Red", selectedColor: .constant("Red"))
    }
}

