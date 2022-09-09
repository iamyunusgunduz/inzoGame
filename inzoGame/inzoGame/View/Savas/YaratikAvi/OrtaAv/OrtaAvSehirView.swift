//
//  OrtaAvSehirView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 9.09.2022.
//

import SwiftUI

struct OrtaAvSehirView: View {
    var gelenSavasCarpaniDegeri:Int?
    var body: some View {
        Text("Sehir \(gelenSavasCarpaniDegeri!)")
    }
}

struct OrtaAvSehirView_Previews: PreviewProvider {
    static var previews: some View {
        OrtaAvSehirView()
    }
}
