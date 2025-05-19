//
//  PokemonListViewModel.swift
//  Flag Quizz
//
//  Created by SDV Bordeaux on 19/05/2025.
//

import Foundation

@MainActor
@Observable
class PokemonListViewModel: ObservableObject {
    var pokemons: [Pokemon] = []

    func loadPokemons() async {
        pokemons = await APICall.getPokemons()
    }
}
