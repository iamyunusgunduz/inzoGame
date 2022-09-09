//
//  ZayifAvDetayView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 9.09.2022.
//

import SwiftUI

struct ZayifAvDetayView: View {
  @State var gelenSavasPuaniCarpani:Int?
    var body: some View {
        Text("zayif av  mahalle köy şehir  : savas sonucu \(gelenSavasPuaniCarpani!)")
    }
}

struct ZayifAvDetayView_Previews: PreviewProvider {
    static var previews: some View {
        ZayifAvDetayView()
    }
}
