//
//  ContentView.swift
//  Flag Quizz
//
//  Created by SDV Bordeaux on 14/05/2025.
//

import SwiftUI

struct ModeMenuView: View {
    var body: some View {
        
        NavigationStack {
            ZStack {
                BackgroundColor()
                
                VStack {
                    Text("Modes de jeu")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    
                    NavigationLink (destination: QuizClassiqueView()) {
                        CustomButton (
                            text: "Classique",
                            backgroundColor: .green,
                            image: "cat.fill"
                        )
                    }
                    
                    //NavigationLink (destination: QuizClassiqueView()) {
                        ZStack {
                            CustomButton (
                                text: "Speedrun",
                                backgroundColor: .gray,
                                image: "hare.fill"
                            ).opacity(0.5)
                            
                            Image(systemName: "lock.fill")
                                .resizable()
                                .frame(width: 25, height: 30)
                                .foregroundColor(.gray)
                        }
                    //}
                    
                    //NavigationLink (destination: QuizClassiqueView()) {
                        ZStack {
                            CustomButton (
                                text: "1 seconde",
                                backgroundColor: .gray,
                                image: "bolt.fill"
                            ).opacity(0.5)
                            
                            Image(systemName: "lock.fill")
                                .resizable()
                                .frame(width: 25, height: 30)
                                .foregroundColor(.gray)
                        }
                    //}
                    
                    //NavigationLink (destination: QuizGenerationView()) {
                        ZStack {
                            CustomButton (
                                text: "Génération",
                                backgroundColor: .gray,
                                image: "calendar"
                            ).opacity(0.5)
                            
                            Image(systemName: "lock.fill")
                                .resizable()
                                .frame(width: 25, height: 30)
                                .foregroundColor(.gray)
                        }
                    //}
                }
            }
        }
    }
}

#Preview {
    ModeMenuView()
}
