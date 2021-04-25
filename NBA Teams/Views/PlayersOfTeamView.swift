//
//  PlayersOfTeamView.swift
//  NBA Teams
//
//  Created by ulixe on 25/04/21.
//

import SwiftUI

struct PlayersOfTeamView: View {

    @ObservedObject var viewModel: PlayersViewModel

    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                HStack {
                    Button(action: {
                        Navigator.instance.popToNVC()
                    }, label: {
                        Text("Back")
                    })
                    .padding(.leading)
                    Spacer()

                }
                Text(self.viewModel.team?.fullName ?? "")
                    .bold()
                    .fontWeight(.bold)
            }
            List(self.viewModel.players, id: \.id) { player in
                ZStack {
                    ThreeLabelView(obj: player)
                    Button(action: {
                        Navigator.instance.pushPlayerDetail(playerID: player.id)
                    }, label: {
                        Text("")
                    })
                }
            }
        }
        .padding(.top, 20)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            self.viewModel.didLoad()
        })
        .overlay(LoaderView(isLoading: self.$viewModel.isLoading))
    }
}

struct PlayersOfTeamView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersOfTeamView(viewModel: PlayersViewModel())
    }
}
