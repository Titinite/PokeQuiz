//
//  Button.swift
//  Flag Quizz
//
//  Created by SDV Bordeaux on 15/05/2025.
//

import SwiftUI

struct CustomButton: View {
    let text: String
    let backgroundColor: Color
    let image: String
    
    var body: some View {
        Label(text, systemImage: image)
            .frame(width: 300, height: 30)
            .font(.system(size: 22))
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding()
            .background(backgroundColor)
            .cornerRadius(10)
    }
}
