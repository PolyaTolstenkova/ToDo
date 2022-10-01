//
//  AddButtonView.swift
//  ToDo
//
//  Created by Полина Толстенкова on 27.09.2022.
//

import SwiftUI

struct AddButtonView: View {
    @State var isPresented: Bool
    @State var database: TaskVM
    var body: some View {
        Button {
            isPresented = true
        } label: {
            Text("+")
        }.font(.system(size: 35))
            .foregroundColor(.purple)
            .sheet(isPresented: $isPresented, onDismiss: database.update) {
                AddTaskView()
                    .environmentObject(database)
            }
    }
}
struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView(isPresented: false, database: TaskVM())
    }
}
