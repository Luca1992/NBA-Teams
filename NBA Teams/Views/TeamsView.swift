//
//  TeamsView.swift
//  NBA Teams
//
//  Created by ulixe on 25/04/21.
//

import SwiftUI

struct TeamsView: View {

    @ObservedObject var viewModel: TeamsViewmodel

    var body: some View {
        VStack(spacing: 20) {
            Text("NBA Teams")
                .bold()
                .fontWeight(.bold)
            List(self.viewModel.teams, id: \.id) { team in
                ZStack {
                    ThreeLabelView(obj: team)
                    Button(action: {
                        Navigator.instance.pushAllPlayersByTeam(team: team)
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
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView(viewModel: TeamsViewmodel())
    }
}
