//
//  GucluAvMahalleView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 9.09.2022.
//

import SwiftUI

struct GucluAvMahalleView: View {
    var gelenSavasCarpaniDegeri:Int?
    var body: some View {
        Text("Mahalle \(gelenSavasCarpaniDegeri!)")
    }
}

struct GucluAvMahalleView_Previews: PreviewProvider {
    static var previews: some View {
        GucluAvMahalleView()
    }
}
