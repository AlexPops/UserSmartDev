//
//  NewUserView.swift
//  UserSmartDev
//
//  Created by MacBook Pro M1 on 26/09/2022.
//

import SwiftUI

struct NewUserView: View {
    
    @ObservedObject var userModel = UserModel()
    
    @Binding var newUserPressed: Bool
    @State var id: Int
    @State var nom: String
    @State var prenom: String
    @State var identifiant: String
    @State var mdp: String
    @State var tel: String
    @State var type: String
    @State var rayon: String
    @State var poste: String
    @State var magasin: String
    @State var avatar: String

    func validerUser(){
        print("Mon avatar est \(avatar)")

        userModel.newUser(id: id, avatar: avatar, identifiant: identifiant, nom: nom, prenom: prenom, rayon: rayon, mdp: mdp, tel: tel, type: type, magasin: magasin)
        newUserPressed = false
    }

    var body: some View {
        
        VStack {
            VStack {
                Image(systemName: "person.crop.circle.badge.plus")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.orange)
                    .frame(width: 80, height: 80, alignment: .center)
            }
            .padding()
            
            List {
                Stepper(value: $id, in: 1...10){
                    Text("ID \(id)")
                }
                TextField("Avatar", text: $avatar)
                TextField("Nom", text: $nom)
                TextField("Prénom", text: $prenom)
                TextField("Identifiant", text: $identifiant)
                SecureField("Mot de passe", text: $mdp)
                TextField("Téléphone", text: $tel)
                TextField("Type", text: $type)
                TextField("Rayon", text: $rayon)
                TextField("Magasin", text: $magasin)
            }
            .listStyle(.grouped)
            
            Spacer()
            
            HStack {
                Spacer()
                
                //MARK: - BTN ANNULER
                Button {
                    annulerUser()
                } label: {
                    HStack {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 26, alignment: .center)
                        Text("Annuler")
                    }
                }
                .padding(10)
                .foregroundColor(Color.red)
                .background(Color(.gray))
                .cornerRadius(10)


                Spacer()
                //MARK: - BTN VALIDER
                Button(action: self.validerUser) {
                    Text("Valider")
                        
                        .fontWeight(.bold)
                        .padding([.leading,.trailing])
                        .background(Color(.black))
                        .foregroundColor(Color(.white))
                        .cornerRadius(5)
                }

                Spacer()
                
            }
            
            Spacer()
        }
    }
    
    //MARK: - FONCTION ANNULER
    func annulerUser() {
        newUserPressed.toggle()
    }

}

struct NewUserView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserView(newUserPressed: .constant(false),id: 12, nom: "Nom", prenom: "prenom", identifiant: "identifiant", mdp: "MdP", tel: "0102030405", type: "Type", rayon: "Rayon", poste: "Poste", magasin: "avermes", avatar: "m1")
    }
}
