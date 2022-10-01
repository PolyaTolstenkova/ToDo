//
//  ContentView.swift
//  ToDo
//
//  Created by Полина Толстенкова on 11.09.2022.
//

import SwiftUI
import RealmSwift

struct ContentView: View {

@ObservedObject var database = TaskVM()
@State private var isPresented: Bool = false
@State private var showOptions: Bool = false
@State private var isCompleted: Bool = false

var body: some View {
    NavigationView {
        List {
            ForEach(database.tasks, id: \.id) { task in
                ListRowView(task: task)
            }.onDelete(perform: database.delete)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                AddButtonView(isPresented: isPresented, database: database)
            }
            ToolbarItem(placement: .navigationBarLeading) {
                SwitchButtonView(showOptions: showOptions, database: database)
            }
        }
    }
    .onAppear(perform: {
        database.update()
    })
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TaskVM())
    }
}
}


