//
//  GucluAvKoyView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 9.09.2022.
//

import SwiftUI

struct GucluAvKoyView: View {
    var gelenSavasCarpaniDegeri:Int?
    var body: some View {
        Text("Koy \(gelenSavasCarpaniDegeri!)")
    }
}

struct GucluAvKoyView_Previews: PreviewProvider {
    static var previews: some View {
        GucluAvKoyView()
    }
}
