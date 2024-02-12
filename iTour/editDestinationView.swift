//
//  editDestinationView.swift
//  iTour
//
//  Created by Sanjai Balajee on 12/02/24.
//

import SwiftUI
import SwiftData
struct editDestinationView: View {
    @Bindable var destination:Destination
    var body: some View {
        Form{
            TextField("Name", text:$destination.name)
            TextField("Details", text:$destination.details)
            DatePicker("Date", selection: $destination.date)
            
            Section("Priority"){
                Picker("Priority", selection:$destination.priority){
                    Text("Meh").tag(1)
                    Text("Yes").tag(2)
                    Text("No").tag(3)
                }
                .pickerStyle(.segmented)
            }
        }
    }
    
}

#Preview {
    do{
        let config=ModelConfiguration(isStoredInMemoryOnly: true)
        let container=try ModelContainer(for:Destination.self, configurations: config)
        let example=Destination(name:"Sanjai", details: "THis is Sanjai")
        return editDestinationView(destination: example)
            .modelContainer(container)
            
    }
    catch{
        fatalError("Error Happened")
    }
    
    
}
