//
//  ghostBoardApp.swift
//  ghostBoard
//
//  Created by Shady Elkassas on 27/09/2023.
//

import SwiftUI

@main
struct ghostBoardApp: App {
    
    //Initialize view model.
    @StateObject var viewModel: PaintViewModel = PaintViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            MainView()
                .environmentObject(viewModel)  //Add view model as enviroment object
            
            
        }
    }
}
