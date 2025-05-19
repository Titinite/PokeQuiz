import Foundation

@MainActor
@Observable
class ClassiqueViewModel: QuizViewModel {
    var nbQuestion: Int = 0
    
    func loadQuestion() {
        if (nbQuestion < 20) {
            nbQuestion += 1
            generateQuestion()
        }
    }
}
