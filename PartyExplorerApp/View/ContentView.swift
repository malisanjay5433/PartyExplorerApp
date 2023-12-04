//
//  ContentView.swift
//  PartyExplorerApp
//
//  Created by Sanjay Mali on 04/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @StateObject private var viewmodel = PartyViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                List(viewmodel.isSearching ? viewmodel.filteredParties : viewmodel.allParties){ party in
                    CardView(party: party)
                }
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .listStyle(.plain)
        .searchable(text: $viewmodel.searchText, placement: .automatic, prompt: "Look for events")
        .task {
            await viewmodel.loadPartyList()
        }
        
        .overlay(alignment: .bottomTrailing){
            Button {
                // Action
            } label: {
                Image(systemName: "plus")
                    .font(.title.weight(.semibold))
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .shadow(radius: 4, x: 0, y: 4)
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
