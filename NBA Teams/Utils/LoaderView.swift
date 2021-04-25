//
//  LoaderView.swift
//  NBA Teams
//
//  Created by ulixe on 25/04/21.
//

import SwiftUI

struct LoaderView: View {

    @Binding var isLoading: Bool
    @State var isAnimation: Bool = false

    var body: some View {
        if self.isLoading {
            self.spinnerBody
        }
    }

    var spinnerBody: some View {
        Image("Spinner")
            .resizable()
            .frame(width: 130, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .rotationEffect(.degrees(self.isAnimation ? 360 : 0))
            .animation(Animation.linear(duration: 0.8).repeatForever(autoreverses: false))
            .onAppear {
                self.isAnimation.toggle()
            }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView(isLoading: .constant(false))
    }
}
