//
//  QuestionListVM.swift
//  GeoQuiz
//
//  Created by Christopher Yoon on 1/7/24.
//

import Foundation
import Combine

class QuestionListVM: ObservableObject {
    @Published private (set) var questions : [Question] = []
    
    private let ds = FBDataService<Question>(path: "questions")
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        ds.getData().sink { error in
            fatalError("\(error)")
        } receiveValue: { [weak self] questions in
            self?.questions = questions
        }
        .store(in: &cancellables)
    }
    
    func create(question: Question) {
        ds.add(question)
    }
    func update(question: Question) {
        ds.update(question)
    }
    func delete(question: Question) {
        ds.delete(question)
    }
    func delete(indexSet: IndexSet) {
        ds.delete(indexSet: indexSet)
    }
}
