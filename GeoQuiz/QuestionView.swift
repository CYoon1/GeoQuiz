//
//  QuestionView.swift
//  GeoQuiz
//
//  Created by Christopher Yoon on 12/29/23.
//

import SwiftUI
import Observation
import SDWebImageSwiftUI
/*
 Create DataModel and ViewModel
 QuestionModel
 QuestionVM
 
 Part 2
 
 ImageURL in Question: String
 
 Programatically Display the QuestionView
 Discard ListView
 
 Part 3
 
 Set up semi-transparent questionview with location in background (zstacked optionally)
 Use to answer questions such as 'where is this picture?'
 
 User SDWeb Image for Image
 
 Part 4
 
 Add Background for Textfields to ensure legibility
 */

@Observable class Question: Identifiable {
    let id: UUID = UUID()
    var questionText: String
    var answerArray: [String]
    
    var answerString: String = ""
    var imageURL: String = ""
    
    static let examples = [
        Question(questionText: "What city?", answerArray: ["London", "Paris", "Rome"], answerString: "Paris", imageURL: "https://lh3.googleusercontent.com/p/AF1QipOSojyYuemoPo1TwH7J6mFC35Y89oKXMHgLIK7-=s680-w680-h510"),
        
        Question(questionText: "What city?", answerArray: ["London", "Paris", "Rome"], answerString: "London", imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Elizabeth_Tower%2C_June_2022.jpg/1024px-Elizabeth_Tower%2C_June_2022.jpg")
    ]
    
    init(questionText: String = "", answerArray: [String] = [], answerString: String = "", imageURL: String =  "") {
        self.questionText = questionText
        self.answerArray = answerArray
        self.answerString = answerString
        self.imageURL = imageURL
    }
}

struct QuestionView: View {
    @State var selectedAnswer: String = ""
    var question: Question = Question()
    
    var body: some View {
        ZStack {
            WebImage(url: URL(string: question.imageURL))
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text(question.questionText)
                    .font(.title)
                    .padding()
                    .background() {
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundStyle(.white)
                            .opacity(0.5)
                    }
                ForEach(question.answerArray, id: \.self) { answer in
                    Button(answer) {
                        selectedAnswer = answer
                    }
                    .font(.subheadline)
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}



#Preview {
    QuestionView(question: Question.examples[1])
}


//struct QuestionView: View {
//
//    @State var selectedAnswer: String = ""
//
//    var question: QuestionModel = QuestionModel()
//
//    var body: some View {
//        Form {
//            Section ("Question"){
//                Text(question.questionText)
//            }
//            Section ("Answers"){
//                ForEach(question.answerArray, id: \.self) { answer in
//                    HStack {
//                        Text(answer)
//                        Spacer()
//                    }
//                    .contentShape(Rectangle())
//                    .onTapGesture {
//                        selectedAnswer = answer
//                    }
//                }
//            }
//            Section ("debug") {
//                Text("Selected Answer: \(selectedAnswer)")
//                Button("Reset") {
//                    selectedAnswer = ""
//                }
//            }
//        }
//    }
//}
