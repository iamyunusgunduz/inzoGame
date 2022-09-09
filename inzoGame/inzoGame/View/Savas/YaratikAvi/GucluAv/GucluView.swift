//
//  GucluView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 8.09.2022.
//

import SwiftUI

struct GucluView: View {
    @State private var sayfaGecisGucluAvMahalle:Bool = false
    @State private var sayfaGecisGucluAvKoy:Bool = false
    @State private var sayfaGecisGucluAvSehir:Bool = false
    var body: some View {
        NavigationView{
            
        
        VStack{
            Spacer()
            Text("Mahalle 50 - 65 lv").padding()
            Button("Ava çık"){
                sayfaGecisGucluAvMahalle = true
                
            }.sheet(isPresented: $sayfaGecisGucluAvMahalle) {
                ZayifAvMahalleView(gelenSavasCarpaniDegeri:7)
                
            }
            Text("Köy 66 - 82 lv").padding()
            Button("Ava Çık"){
                sayfaGecisGucluAvKoy = true
            }.sheet(isPresented: $sayfaGecisGucluAvKoy) {
                ZayifAvKoyView(gelenSavasCarpaniDegeri:8)
            }
            
            Text("Şehir 83 - 100 lv ").padding()
            Button("Ava Çık"){
                sayfaGecisGucluAvSehir = true
            }.sheet(isPresented: $sayfaGecisGucluAvSehir) {
                ZayifAvSehirView(gelenSavasCarpaniDegeri:9)
            }
            Spacer()
        }
        
    }.navigationTitle("Guclu Yaratik Avi")
    }
}

struct GucluView_Previews: PreviewProvider {
    static var previews: some View {
        GucluView()
    }
}
