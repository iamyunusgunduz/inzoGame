//
//  ZayifAvSehirView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 9.09.2022.
//

import SwiftUI

struct ZayifAvSehirView: View {
    var gelenSavasCarpaniDegeri:Int?
    var body: some View {
        Text("Sehir \(gelenSavasCarpaniDegeri!)")
    }
}

struct ZayifAvSehirView_Previews: PreviewProvider {
    static var previews: some View {
        ZayifAvSehirView()
    }
}
