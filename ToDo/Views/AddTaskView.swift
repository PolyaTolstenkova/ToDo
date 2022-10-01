//
//  AddTaskView.swift
//  ToDo
//
//  Created by Полина Толстенкова on 11.09.2022.
//

import SwiftUI

struct AddTaskView: View {
    
    @EnvironmentObject var database: TaskVM
    @Environment(\.dismiss) var dismiss
    @State var title = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter new task", text: $title)
                    .padding()
                    .frame(width: 300, height: 50, alignment: .center)
                    .border(Color.primary, width: 1)
                    .padding(.top, 40)
                    .font(.system(size: 20))
                Button {
                    database.save(title)
                    dismiss()
                } label: {
                    Text("Add")
                }
                .padding()
                .frame(width: 200, height: 50, alignment: .center)
                .background(Color.purple)
                .foregroundColor(.white)
                .font(.system(size: 20))
                .padding(.top, 20)
                Spacer()
            }
            .navigationTitle("Add task")
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
