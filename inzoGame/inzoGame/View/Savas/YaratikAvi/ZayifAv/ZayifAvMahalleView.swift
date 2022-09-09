//
//  ZayifAvMahalleView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 9.09.2022.
//

import SwiftUI

struct ZayifAvMahalleView: View {
    @Environment(\.presentationMode) var sunumModu
    var gelenSavasCarpaniDegeri:Int?
    var body: some View {
       
        VStack{
          let rastgeleSayi = Int.random(in: 1...5)
            if rastgeleSayi == 1 || rastgeleSayi == 2 || rastgeleSayi == 3{
                Text("Uzun arayiş sonunda bir ava rastladin ve alt ettin. \(rastgeleSayi)").padding(20).foregroundColor(Color.green)
                // username ile  + tecrube para  - can
                // degerler ya girdigim degerle otomatik artip azalcak yada ben kendim cekip uzerine update edicem
                
            }
            if rastgeleSayi == 4 {
                Text("Gecenin karanliginda bir kisiyle karsilastin fakat elinden kacmayi basardi \(rastgeleSayi) ").padding(20).foregroundColor(Color.gray)
                // + tecrube para  - can
            }
            if rastgeleSayi == 5 {
                Text("Dişine göre bir av buldun,  fakat  bu seferlik şansın yaver gitmedi. Senden güçlü gibiydi ! \(rastgeleSayi) ").padding(20).foregroundColor(Color.red)
                // + tecrube para  - can
            }
            Button("TAMAM"){
                self.sunumModu.wrappedValue.dismiss()
            }
        }
       
        
       
    }
}

struct ZayifAvMahalleView_Previews: PreviewProvider {
    static var previews: some View {
        ZayifAvMahalleView()
    }
}
