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
    @State var isAddViewOpen: Bool = false
    
    var body: some View {
        NavigationStack {
            List(questionListVM.questions) { question in
                NavigationLink {
                    QuestionView(question: question)
                } label: {
                    Text(question.questionText)
                }
            }
            .navigationDestination(isPresented: $isAddViewOpen) {
                AddQuestionView(questionList: questionListVM)
            }
            .navigationTitle("Question List")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        isAddViewOpen.toggle()
                    } label: {
                        Label("Add New Question", systemImage: "plus")
                    }
                    
                }
            }
        }
    }
}

#Preview {
    QuestionListView()
}
