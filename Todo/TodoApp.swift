//
//  TodoApp.swift
//  Todo
//
//  Created by ray on 7/26/23.
//

import SwiftUI

@main
struct TodoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }.navigationViewStyle(StackNavigationViewStyle()).environmentObject(listViewModel)
        }
    }
}
