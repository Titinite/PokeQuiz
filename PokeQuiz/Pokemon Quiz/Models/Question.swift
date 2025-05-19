//
//  Question.swift
//  Flag Quizz
//
//  Created by SDV Bordeaux on 19/05/2025.
//

import Foundation
import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    let pokemon : Pokemon
    var color : Color  = Color.blue.opacity(0.5)
}
