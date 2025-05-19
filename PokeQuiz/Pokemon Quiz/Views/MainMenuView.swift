//
//  ContentView.swift
//  Flag Quizz
//
//  Created by SDV Bordeaux on 14/05/2025.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        
        NavigationStack {
            ZStack {
                BackgroundColor()
                
                VStack {
                    Image("Pokemon Logo")
                        .resizable()
                        .frame(width: 325, height: 325)
                        .padding()
                    
                    NavigationLink (destination: ModeMenuView()) {
                        CustomButton (
                            text: "Jouer",
                            backgroundColor: .green,
                            image: "play.fill"
                        )
                    }
                    
                    NavigationLink (destination: PokemonListView()) {
                        ZStack {
                            CustomButton (
                                text: "Apprendre",
                                backgroundColor: .brown,
                                image: "list.clipboard.fill"
                            )
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MainMenuView()
}
