//
//  ThreeLabelView.swift
//  NBA Teams
//
//  Created by ulixe on 25/04/21.
//

import SwiftUI

struct ThreeLabelView: View {

    @State var obj: ThreeLabel

    var body: some View {
        VStack(alignment: .leading,
               spacing: 10,
               content: {
            Text(self.obj.upperTitle)
            Text(self.obj.centerTitle)
                .fontWeight(.bold)
                .bold()
            Text(self.obj.lowerTitle)
        })
    }
}

//struct ThreeLabelView_Previews: PreviewProvider {
//    static var previews: some View {
//
//    }
//}
