//
//  SwitchButtonView.swift
//  ToDo
//
//  Created by Полина Толстенкова on 27.09.2022.
//

import SwiftUI

struct SwitchButtonView: View {
    @State var showOptions: Bool
    @State var database: TaskVM
    
    var body: some View {
        Button {
            showOptions = true
        } label: {
            Image(systemName: "arrow.left.arrow.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.purple)
                .frame(width: 25, height: 25)
        }
        .confirmationDialog("Pick DataBase", isPresented: $showOptions, titleVisibility: .visible) {
            Button("Realm") {
                database.switchDataManager(to: .realm)
            }
            
            Button("CoreData") {
                database.switchDataManager(to: .coreData)
            }
            
            Button("UserDefaults") {
                database.switchDataManager(to: .userDefaults)
            }
        }
    }
}

struct SwitchButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchButtonView(showOptions: false, database: TaskVM())
    }
}
