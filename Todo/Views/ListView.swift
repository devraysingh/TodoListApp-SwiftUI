//
//  ListView.swift
//  Todo
//
//  Created by ray on 7/26/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
                NoItemsView().transition(AnyTransition.opacity.animation(.easeInOut))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item).onTapGesture {
                            withAnimation(.linear){
                                listViewModel.updateItem(item: item)
                            }
                        }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }.listStyle(.automatic)
            }
        }
        .navigationTitle("Todo List 📝")
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink("Add", destination: AddView()))

    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }.environmentObject(ListViewModel())
    }
}

