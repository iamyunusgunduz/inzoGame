//
//  OrtaAvMahalleView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 9.09.2022.
//

import SwiftUI

struct OrtaAvMahalleView: View {
    var gelenSavasCarpaniDegeri:Int?
    var body: some View {
        Text("Mahalle \(gelenSavasCarpaniDegeri!)")
    }
}

struct OrtaAvMahalleView_Previews: PreviewProvider {
    static var previews: some View {
        OrtaAvMahalleView()
    }
}
