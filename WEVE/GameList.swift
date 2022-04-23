//
//  GameList.swift
//  Hackathon
//
//  Created by Seungwon An on 4/22/22.
//

import SwiftUI

struct GameList: View {
    var body: some View {
        List(games) {game in
            HStack {
                game.image
                    .resizable()
                    .frame(width: 50, height: 50)
                Text(game.name)
                
                Spacer()
            }
            .onTapGesture {
                UIApplication.shared.open(URL(string:"https://www.naver.com")!)
            }
        }
        .listStyle(PlainListStyle())
        
    }
}

struct GameList_Previews: PreviewProvider {
    static var previews: some View {
        GameList()
            .previewInterfaceOrientation(.portrait)
    }
}
