//
//  UserDetailView.swift
//  UserSmartDev
//
//  Created by MacBook Pro M1 on 21/09/2022.
//

import SwiftUI

struct UserDetailView: View {
    
    @ObservedObject var userModel = UserModel()
    var userItem:UserItem

    var body: some View {
        VStack {
            VStack {
                Image("\(userItem.avatar)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                Text(userItem.nom + " " + userItem.prenom)
                    .font(.title2)
                Text(userItem.rayon)
                    .font(.headline)
                    .foregroundColor(.red)
            }
            .padding(.bottom, 30)
            
            List {
                HStack {
                    Text("Identifiant")
                    Spacer()
                    Text(userItem.identifiant)
                        .font(.body)
                        .foregroundColor(.blue)
                }
                
                HStack {
                    Text("Mot de passe")
                    Spacer()
                    Text(userItem.mdp)
                        .font(.body)
                        .foregroundColor(.blue)
                        
                }

                HStack {
                    Text("Téléphone")
                    Spacer()
                    Text(userItem.tel)
                        .font(.body)
                        .foregroundColor(.blue)
                }
                
                HStack {
                    Text("Type")
                    Spacer()
                    Text(userItem.type)
                        .font(.body)
                        .foregroundColor(.blue)
                }
            }
            .listStyle(.grouped)
            
            Spacer()
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(userModel: UserModel(), userItem: testUserItem)
    }
}
