//
//  AsyncImage.swift
//  PartyExplorerApp
//
//  Created by Sanjay Mali on 04/12/23.
//

import SwiftUI
struct CardView: View {
    var party: PartyModel
    var body: some View {
        VStack{
            AsyncImage(url: party.bannerImageURL) { phase in
                switch phase {
                case .empty:
                    Image("placeholder").resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxHeight:200)
                        .cornerRadius(8.0)
                        .overlay {
                            ProgressView().padding().foregroundColor(.white)
                        }
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxHeight: 200)
                        .cornerRadius(8.0)
                case .failure:
                    Image("placeholder").resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxHeight:200)
                        .cornerRadius(8.0)
                @unknown default:
                    // Since the AsyncImagePhase enum isn't frozen,
                    // we need to add this currently unused fallback
                    // to handle any new cases that might be added
                    // in the future:
                    EmptyView()
                }
            }
            .overlay(alignment: .topTrailing){
                HStack{
                    let date = party.startDate.formatted(.dateTime.day().month().year())
                    Image(systemName: "calendar")
                    Text(date).padding()
                        .padding(.leading,-16).fontWeight(.regular)
                }
            }
        }.listRowSeparator(.hidden)
        HStack{
            Text(party.name).font(.title2).bold().padding()
            Text(
                party.price <= 0.0
                ? "FREE"
                : "＄\(String(format: "%.2f", party.price))"
            )
            .fontWeight(.regular)
            .padding(.vertical, 2.0)
            .padding(.horizontal)
            .overlay(
                Capsule().stroke(lineWidth: 0.8)
            )
        }
    }
}

