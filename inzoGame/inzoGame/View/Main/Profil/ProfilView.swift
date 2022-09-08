//
//  ProfilView.swift
//  inzoGame
//
//  Created by Yunus Gündüz on 8.09.2022.
//

import SwiftUI

struct ProfilView: View {
    var body: some View {
        NavigationView{
            Section {
                Text("Profil")
            }
         
            .navigationTitle("Profil")
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
