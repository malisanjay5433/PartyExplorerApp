//
//  PartyViewModel.swift
//  PartyExplorerApp
//
//  Created by Sanjay Mali on 04/12/23.
//

import Foundation
import Combine
@MainActor
class PartyViewModel : ObservableObject{
    @Published private(set) var allParties:[PartyModel] = []
    @Published private(set) var filteredParties:[PartyModel] = []
    
    @Published var searchText:String = ""
    private var cancellable = Set<AnyCancellable>()
    let manager = MockData()
    
    init(){
        addSubscribers()
    }
    
    var isSearching:Bool{
        !searchText.isEmpty
    }
    
    
    // MARK: `addSubscribers` Manages the subscription to changes in the search text and triggers the filtering process
    private func addSubscribers(){
        $searchText.debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { [weak self] searchText in
                self?.filteredParties(searchText: searchText)
            }
            .store(in: &cancellable)
    }
    
    // MARK: `filteredParties` Updates the filtered parties based on the search text input
    private func filteredParties(searchText : String){
        guard !searchText.isEmpty else {
            filteredParties = []
            return
        }
        let search = searchText.lowercased()
        filteredParties = allParties.filter({ party in
            let containsSearch = party.name.lowercased().contains(search)
            return containsSearch
        })
    }
    // MARK: Loads the initial list of parties asynchronously, allowing for the population of the allParties property
    func loadPartyList() async{
        do {
            allParties = try await manager.getAllParties()
        }
        catch{
            print(error.localizedDescription)
        }
    }
}
