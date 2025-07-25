//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var showNewTask = false
    @Query var toDos: [ToDoItem]
    
    var body: some View {
        VStack{
            HStack{
                Text("To-Do List")
                    .font(.system(size:40))
                    .fontWeight(.bold)
                    Spacer()
                Button {
                    withAnimation {
                        showNewTask = true
                    }
                } label: {
                        Text("+")
                        .font(.system(size:40))
                    }
            }
            .padding()
            Spacer()
            
            List {
                ForEach(toDos) { toDoItem in
                    if toDoItem.isImportant {
                        Text("‼️"+toDoItem.title)
                    } else {
                        Text(toDoItem.title)
                    }
                }
            }
            .listStyle(.plain)
        }
        if (showNewTask){
            NewToDoView(toDoItem: ToDoItem(title: "", isImportant: false), showNewTask: $showNewTask)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ToDoItem.self, inMemory: true)
}
