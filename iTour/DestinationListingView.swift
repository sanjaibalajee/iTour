//
//  DestinationListingView.swift
//  iTour
//
//  Created by Sanjai Balajee on 12/02/24.
//

import SwiftUI
import SwiftData

struct DestinationListingView: View {
    @Environment(\.modelContext)  var modelContext
    @Query(sort:[SortDescriptor(\Destination.name),SortDescriptor(\Destination.priority,order:.reverse)]) var destinations:[Destination]
    
    
    var body: some View {
        List{
            ForEach(destinations) { destination in
                NavigationLink(value:destination){
                    VStack(alignment: .leading){
                        Text(destination.name)
                            .font(.headline)
                        Text(destination.date.formatted(date:.long, time:.shortened))
                    }
                    
                }
              
            }
            .onDelete(perform:deleteaction)
            
            
           
           
        }
    }
    init(sort:SortDescriptor<Destination>, searchString:String){
        _destinations=Query(filter: #Predicate{
            if searchString.isEmpty{
                return true
            }else{
                return $0.name.localizedStandardContains(searchString)
            }
        })
    }
    func deleteaction(_ indexSet:IndexSet){
        for index in indexSet{
            let destination=destinations[index]
            modelContext.delete(destination)
        }
        print("Deleted")
    }
}

#Preview {
    DestinationListingView(sort:SortDescriptor(\Destination.name),searchString: "")
}
