//
//  PlayerDetailView.swift
//  NBA Teams
//
//  Created by ulixe on 25/04/21.
//

import SwiftUI

struct PlayerDetailView: View {
    @ObservedObject var viewModel: PlayerDetailViewModel
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button("Back") {
                    Navigator.instance.popToNVC()
                }
                .padding(.leading)
                Spacer()
            }
            HStack {
                Text("Name: " + (self.viewModel.detail?.firstName ?? ""))
                    .padding(.leading)
                Spacer()
                Text("Surname: " + (self.viewModel.detail?.lastName ?? ""))
                    .padding(.trailing)
            }
            HStack {
                Text("Team: " + (self.viewModel.detail?.team.fullName ?? ""))
                    .padding(.leading)
                Spacer()
                if !(self.viewModel.detail?.position.isEmpty ?? true) {
                    Text("Position: " + ( self.viewModel.detail?.position ?? ""))
                        .padding(.trailing)
                }
            }
            Divider()
            HStack {
                if let heightFeet = self.viewModel.detail?.heightFeet {
                    Text("Height feet: " + "\(heightFeet)")
                        .padding(.leading)
                }
                Spacer()
                if let heightInches = self.viewModel.detail?.heightInches {
                    Text("Height inches: " + "\(heightInches)")
                        .padding(.leading)
                }
            }
            HStack {
                if let weightInches = self.viewModel.detail?.weightPounds {
                    Text("Weight pounds: " + "\(weightInches)")
                        .padding(.leading)
                }
                Spacer()
            }
            Spacer()
        }
        .padding(.top, 20)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            self.viewModel.didLoad()
        })
    }
}

struct PlayerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetailView(viewModel: PlayerDetailViewModel())
    }
}
