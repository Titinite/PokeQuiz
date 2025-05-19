import Foundation

@MainActor
@Observable
class QuizViewModel: ObservableObject {
    var pokemons: [Pokemon] = []
    var question: [Question] = []
    var correctAnswer: Question?
    
    func loadPokemons() async {
        pokemons = await APICall.getPokemons()
    }
    
    func generateQuestion() {
        question = []
        let validPokemons = pokemons.filter { !$0.image.isEmpty }
        guard validPokemons.count >= 4 else { return }
        
        let pokemonSuffled = Array(validPokemons.shuffled().prefix(4))
        for pokemon in pokemonSuffled {
            question.append(Question(pokemon: pokemon))
        }
        correctAnswer = question.randomElement()
    }
    
    func isCorrect(_ question: Question) -> Bool {
        let iscorrect = question.pokemon.name == correctAnswer?.pokemon.name
        changeColor(id: question.id, iscorrect: iscorrect)
        return iscorrect
    }
    
    func changeColor(id : UUID, iscorrect : Bool )  {
        let index = self.question.firstIndex { question in
            question.id == id
        }
        
        if index != nil {
            if iscorrect {
                self.question[index!].color = .green
            }
            else {
                self.question[index!].color = .red
            }
        }
    }
}
