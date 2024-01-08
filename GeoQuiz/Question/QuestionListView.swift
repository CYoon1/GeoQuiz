//
//  QuestionListView.swift
//  GeoQuiz
//
//  Created by Christopher Yoon on 1/1/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct QuestionListView: View {
    @ObservedObject var vm: QuestionListVM
    @State var isShowingAdd = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.questions) { question in
                    QuestionCellView(question: question)
                }
            }
            .navigationTitle("List View")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        isShowingAdd = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .navigationDestination(isPresented: $isShowingAdd) {
                AddQuestionView(vm: vm)
            }
        }
    }
}


/*
import Observation

@Observable class QuestionList {
    var questions: [Question]
    init(questions: [Question] = []) {
        self.questions = questions
        
    }
    
    func createNewQuestion(question: Question) {
        questions.append(question)
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
*/
#Preview {
    QuestionListView(vm: QuestionListVM())
}
