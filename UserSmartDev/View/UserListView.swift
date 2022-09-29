//
//  UserListView.swift
//  UserSmartDev
//
//  Created by MacBook Pro M1 on 21/09/2022.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var userModel = UserModel()
    @State var isNewUser = false

    var rayons:[String] = ["Administratif", "Direction", "Maintenance", "Service Après Vente"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(rayons, id: \.self) { rayon in
                    Section {
                        ForEach(userModel.users.filter({$0.rayon == rayon}), id: \.self.identifiant) { item in
                            NavigationLink(destination: UserDetailView(userItem: item)) {
                                UserRowView(userItem: item, userModel: userModel)
                            }
                            .navigationTitle("Utilisateurs")
                            .navigationBarItems(trailing: plusButton)
                        }
                        .onDelete(perform:delete)
                    }
                    header: {
                        Text(rayon)
                    }
                }
            }
            .listStyle(.insetGrouped)
            
            .sheet(isPresented: $isNewUser, content: {
                NewUserView(newUserPressed: $isNewUser, id: 0, nom: "", prenom: "", identifiant: "", mdp: "", tel: "", type: "", rayon: "", poste: "", magasin: "", avatar: "")
            })
            
        }
    }
    
    //MARK: - BOUTON +
    var plusButton: some View {
        Button(action: {
            isNewUser.toggle()
            print("Fenetre nouvel utilisateur")
        }, label: {
            Image(systemName: "person.crop.circle.badge.plus")
        })
    }
    
    //MARK: - SUPPRIMER UN ELEMENT
    func delete(at offsets:IndexSet){
        userModel.users.remove(atOffsets: offsets)
    }
    

}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
