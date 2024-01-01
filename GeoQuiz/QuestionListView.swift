//
//  QuestionListView.swift
//  GeoQuiz
//
//  Created by Christopher Yoon on 1/1/24.
//

import SwiftUI
import Observation

@Observable class QuestionList {
    var questions: [Question]
    var currentQuestionIndex: Int = 0
    init(questions: [Question] = []) {
        self.questions = questions
        
    }
    
    func createNewQuestion(question: Question) {
        questions.append(question)
    }
    
    func handleAnswerInput() {
        
    }
}

struct QuestionListView: View {
    var questionListVM: QuestionList = QuestionList()
    
    var body: some View {
        NavigationStack {
            NavigationLink {
                AddQuestionView(questionList: questionListVM)
            } label: {
                Text("Add New Question")
            }

            List(questionListVM.questions) { question in
                NavigationLink {
                    QuestionView(question: question)
                } label: {
                    Text(question.questionText)
                }
            }
        }
    }
}

#Preview {
    QuestionListView()
}
