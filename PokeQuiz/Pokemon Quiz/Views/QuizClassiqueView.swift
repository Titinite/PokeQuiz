import SwiftUI

struct QuizClassiqueView: View {
    @State var viewModel = ClassiqueViewModel()
    @State private var score: Int = 0
    @State private var color: Color = .blue.opacity(0.5)
    
    var body: some View {
        ZStack {
            BackgroundColor()
            
            if viewModel.nbQuestion == 20 {
                Text("Score: " + String(score) + "/" + String(viewModel.nbQuestion))
                    .font(.title.bold())
            }
            
            else {
                VStack(spacing: 20) {
                    Text("Quel est ce Pokémon ?")
                        .font(.title2.bold())
                    
                    if let correct = viewModel.correctAnswer,
                       let pokemonURL = URL(string: correct.pokemon.image) {
                        AsyncImage(url: pokemonURL) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(height: 200)
                    }
                    
                    ForEach(viewModel.question) { question in
                        Button {
                            let isCorrect = viewModel.isCorrect(question)
                            color = isCorrect ? .green : .red
                                                        
                            if isCorrect {
                                score += 1
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                color = .blue.opacity(0.5)
                                viewModel.loadQuestion()
                            }
                            
                        } label: {
                            Text(question.pokemon.name)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(question.color))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .fontWeight(.bold)
                        }
                    }
                }
                .padding()
                .task {
                    await viewModel.loadPokemons()
                    viewModel.generateQuestion()
                }
            }
        }
    }
}
        
#Preview {
    QuizClassiqueView(viewModel: ClassiqueViewModel())
}
