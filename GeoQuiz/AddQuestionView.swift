//
//  AddQuestionView.swift
//  GeoQuiz
//
//  Created by Christopher Yoon on 1/1/24.
//

import SwiftUI
import Observation

struct AddQuestionView: View {
    var questionList: QuestionList
    @State var questionText: String = ""
    @State var imageLink: String = ""
    @State var newAnswer: String = ""
    @State var answerArray: [String] = []
    @State var correctAnswer: String? = nil
 
    var body: some View {
        NavigationStack {
            Form {
                Section("Question") {
                    TextField("Question", text: $questionText)
                    TextField("Image Link", text: $imageLink)
                }
                Section("Answers") {
                    HStack {
                        TextField("New Answer", text: $newAnswer)
                        Button("Add") {
                            if (!newAnswer.isEmpty) {
                                answerArray.append(newAnswer)
                                newAnswer = ""
                            } else {
                                print("Answer cannot be empty!")
                            }
                        }
                    }
                    Picker(selection: $correctAnswer) {
                        Text("No Selection")
                            .tag(Optional<String>.none)
                        if !answerArray.isEmpty {
                            Divider()
                            ForEach(answerArray, id: \.self) { answer in
                                Text(answer)
                                    .tag(Optional(answer))
                            }
                        }
                    } label: {
                        Text("Correct Answer")
                    }

                    ForEach(answerArray, id: \.self) { answer in
                        Text("Answer: \(answer)")
                    }
                }
            }
            .navigationTitle("Add New Question")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        if let correctAnswer {
                            let newQuestion = Question(questionText: questionText, answerArray: answerArray, answerString: correctAnswer, imageURL: imageLink)
                            print(newQuestion)
                            questionList.createNewQuestion(question: newQuestion)
                        }
                    } label: {
                        Text("Save")
                    }

                }
            }
        }
    }
}

#Preview {
    AddQuestionView(questionList: QuestionList())
}
