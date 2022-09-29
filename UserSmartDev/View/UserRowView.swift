//
//  UserRowView.swift
//  UserSmartDev
//
//  Created by MacBook Pro M1 on 21/09/2022.
//

import SwiftUI

struct UserRowView: View {
    
    var userItem : UserItem
    @ObservedObject var userModel : UserModel

    var body: some View {
        HStack {
            Image("\(userItem.avatar)")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60, alignment: .center)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("\(userItem.nom)".uppercased())
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("\(userItem.prenom)")
                        .font(.title3)

                }
                Text(userItem.type)
                    .font(.caption)
                    .foregroundColor(.blue)
            }
            Spacer()
        }
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(userItem: UserModel().users[2], userModel: UserModel())
    }
}
