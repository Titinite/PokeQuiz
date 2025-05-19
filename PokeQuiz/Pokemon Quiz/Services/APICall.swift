import Foundation

struct APICall {
    static func getPokemons() async -> [Pokemon] {
        let urlString = "https://pokebuildapi.fr/api/v1/pokemon"
        guard let url = URL(string: urlString) else { return [] }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let pokemons = try JSONDecoder().decode([Pokemon].self, from: data)
            return pokemons
        } catch {
            print(error)
            return []
        }
    }
}
