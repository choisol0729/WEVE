//
//  FavoritesView.swift
//  Hackathon
//
//  Created by Seungwon An on 4/22/22.
//

import SwiftUI



struct FavoritesView: View {
    var body: some View {
        VStack(alignment:.leading) {
            Text("Favorites")
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 100, trailing: 0))
            
            
            GameList()
            Divider()
        }
    }

}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
