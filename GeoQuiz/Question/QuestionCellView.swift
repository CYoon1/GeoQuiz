//
//  QuestionCellView.swift
//  GeoQuiz
//
//  Created by Christopher Yoon on 1/7/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct QuestionCellView: View {
    let question: Question
    var body:some View {
        HStack {
            WebImage(url: URL(string: question.imageURL))
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(6)
            VStack {
                Spacer()
                Text(question.questionText)
                    .font(.headline)
                    .padding()
                    .background() {
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundStyle(.white)
                            .opacity(0.5)
                    }
                ForEach(question.answerArray, id: \.self) { answer in
                    Text("\(answer)")
                    .font(.subheadline)
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

#Preview {
    List {
        QuestionCellView(question: Question.examples[0])
    }
}
