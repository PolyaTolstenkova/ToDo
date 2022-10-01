//
//  ListRowView.swift
//  ToDo
//
//  Created by Полина Толстенкова on 27.09.2022.
//

import SwiftUI

struct ListRowView: View {
    @State var task: TaskModel
    var body: some View {
        Text(task.title)
            .font(.system(size: 25))
            .foregroundColor(.primary)
            .frame(height: 60)
            .listRowBackground(
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.purple)
                    .padding(
                        EdgeInsets(
                            top: 5,
                            leading: 5,
                            bottom: 5,
                            trailing: 5
                        )
                    )
            )
            .listRowSeparator(.hidden)
    }
}


struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(task: UDModel(title: "Hello world"))
    }
}
