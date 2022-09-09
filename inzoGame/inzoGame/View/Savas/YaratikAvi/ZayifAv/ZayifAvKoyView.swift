//
//  ZayifAvKoyView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 9.09.2022.
//

import SwiftUI

struct ZayifAvKoyView: View {
    var gelenSavasCarpaniDegeri:Int?
    var body: some View {
        Text("Koy \(gelenSavasCarpaniDegeri!)")
    }
}

struct ZayifAvKoyView_Previews: PreviewProvider {
    static var previews: some View {
        ZayifAvKoyView()
    }
}
