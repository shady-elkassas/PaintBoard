//
//  ContentView.swift
//  ghostBoard
//
//  Created by Shady Elkassas on 27/09/2023.
//

import SwiftUI

struct MainView: View {
    
    //ViewModel
    @EnvironmentObject var viewModel: PaintViewModel
    
    //State variables
    @State var selectedColor = "None"
    @State var points: [CGPoint] = [] //Points dragged on screen
    
    //Dimensions Constants
    let heightOfScreen = UIScreen.main.bounds.height
    let widthOfScreen = UIScreen.main.bounds.width
    
    
    var body: some View {
        
        ZStack {
            
            ZStack{
                
                //White background
                Color.white
                
                //Track @published "lines" variable
                ForEach(viewModel.lines){ line in
                    
                    drawLine(line: line)
                    
                }
                
                
            }.frame(width: widthOfScreen, height: heightOfScreen).ignoresSafeArea()
            
            //Track dragging gesture
                .gesture(
                    DragGesture(minimumDistance: 0.01)
                        .onChanged { value in
                            
                            //Append each new point to points array
                            let currentPoint = value.location
                            points.append(currentPoint)
                        }
                        .onEnded { _ in
                            
                            //Logic for each colors' delay
                            switch selectedColor{
                                
                            case "Red":
                                sleep(UInt32(1.0))
                                break
                                
                            case "Blue":
                                sleep(UInt32(3.0))
                                break
                                
                            case "Green":
                                sleep(UInt32(5.0))
                                break
                                
                            case "Eraser":
                                sleep(UInt32(2.0))
                                break
                                
                            default:
                                print("No Selected Color")
                                
                            }
                            
                            //ViewModel function to append a new line
                            viewModel.addLine(color: selectedColor, points: points)
                            
                            //Clear points for a new line
                            points = []
                            
                        }
                )
            
            VStack {
                
                //Colors and eraser selection
                LazyHGrid(rows: [GridItem(.fixed(80))], spacing: 30) {
                    
                    
                    CircleButton(color: "Red", selectedColor: $selectedColor)
                    CircleButton(color: "Blue", selectedColor: $selectedColor)
                    CircleButton(color: "Green", selectedColor: $selectedColor)
                    
                    
                    ZStack {
                        CircleButton(color: "Eraser", selectedColor: $selectedColor)
                        
                        Image(systemName: "eraser.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    }

                    
                    
                }
                
                //To place the lazygrid in the top quarter of screen
                Spacer().frame(height: heightOfScreen*0.75)
                
            }.frame(width: widthOfScreen, height: heightOfScreen).ignoresSafeArea()
            
        }
        .padding()
        
        
        
    }
    
    
    //Takes a Line object and returns path of points in selected color
    func drawLine(line: Line) -> some View {
        
        let lineColor:Color
        
        switch line.color {
        case "Red":
            lineColor = Color.red
            
        case "Blue":
            lineColor = Color.blue
            
        case "Green":
            lineColor = Color.green
            
        case "Eraser":
            lineColor = Color.white
            
        default:
            lineColor = Color.white
            
        }
        
        
        
        
        return Path { path in
            guard line.points.count >= 2 else { return }
            let firstPoint = line.points[0]
            path.move(to: firstPoint)
            
            for point in line.points.dropFirst() {
                path.addLine(to: point)
            }
        }
        .stroke(lineColor, lineWidth: 20)
        
        
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        
        MainView()
            .environmentObject(PaintViewModel())
    }
}
