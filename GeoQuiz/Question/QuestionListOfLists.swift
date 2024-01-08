//
//  QuestionListOfLists.swift
//  GeoQuiz
//
//  Created by Christopher Yoon on 1/2/24.
//

import SwiftUI
/*
import Observation

struct QuestionListOfLists: View {
    @State var isAddViewVisible: Bool = false
    var lists = ListOfLists()
    
    var body: some View {
        NavigationStack {
            Form {
                Text("Placeholder")
            }
            .navigationDestination(isPresented: $isAddViewVisible, destination: {
                AddNewList(lists: lists)
            })
            .navigationTitle("List of Lists")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAddViewVisible.toggle()
                    } label: {
                        Label("Add New List", systemImage: "plus")
                    }
                    
                }
            }
        }
    }
}

struct AddNewList: View {
    @State var newListName: String = ""
    var lists: ListOfLists
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("New List", text: $newListName)
                }
                Button {
                    
                } label: {
                    Text("Add New")
                }
            }
        }
    }
}

@Observable class ListOfLists {
    var listOfLists : [QuestionList] = []

    init(lists: [QuestionList] = []) {
        self.listOfLists = lists
        
    }
}

// Need Add New List (Requires Name)
// Display List of Lists

#Preview {
    QuestionListOfLists()
}
*/
