//
//  ContentView.swift
//  iTour
//
//  Created by Sanjai Balajee on 12/02/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext)  var modelContext
    
    @State private var path=[Destination]()
    @State private var sortOrder=SortDescriptor(\Destination.name)
    @State private var searchText=""
    var body: some View {
        NavigationStack(path:$path) {
            DestinationListingView(sort: sortOrder, searchString: searchText).navigationTitle("iTour")
                .navigationDestination(for: Destination.self, destination: editDestinationView.init)
                .searchable(text: $searchText)
                .toolbar{
                    Button("Add Destination", systemImage: "plus", action:addDestination)
                    Menu("Sort", systemImage: "arrow.up.arrow.down"){
                        Picker("Selection", selection: $sortOrder){
                            Text("Name").tag(SortDescriptor(\Destination.name))
                            Text("Priority").tag(SortDescriptor(\Destination.priority, order:.reverse))
                            Text("Date").tag(SortDescriptor(\Destination.date))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path=[destination]
    }
}
#Preview {
    ContentView()
}

