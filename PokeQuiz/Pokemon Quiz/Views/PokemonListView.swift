import SwiftUI

struct PokemonListView: View {
    @StateObject private var viewModel = PokemonListViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.pokemons, id: \.image) { pokemon in
                        VStack(spacing: 8) {
                            AsyncImage(url: URL(string: pokemon.image)) { image in
                                image.resizable().scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())

                            Text(pokemon.name.capitalized)
                                .font(.system(size: 24, weight: .bold))
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Tous les Pokémons")
        }
        .task {
            await viewModel.loadPokemons()
        }
    }
}

#Preview {
    PokemonListView()
}
