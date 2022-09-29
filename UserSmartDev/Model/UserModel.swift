//
//  UserModel.swift
//  UserSmartDev
//
//  Created by MacBook Pro M1 on 21/09/2022.
//

import SwiftUI
import Foundation

struct UserItem:Identifiable {
    var id:Int
    var avatar:String
    var identifiant:String
    var nom:String
    var prenom:String
    var rayon:String
    var mdp:String
    var tel:String
    var type:String
    var magasin:String
}

class UserModel : ObservableObject {

    @Published var users : [UserItem] = []
    
    var lastID:Int = -1
    
    //MARK: - Fonction de création de l'ID
    private func newId()->Int{
        lastID += 1
        return lastID
    }
    
    //MARK: - Fonction de la creation de post
    func newUser(id:Int, avatar:String, identifiant:String, nom: String, prenom: String, rayon: String, mdp:String, tel:String, type:String, magasin:String){

        let user = UserItem(id: id, avatar: avatar, identifiant: identifiant, nom: nom, prenom: prenom, rayon: rayon, mdp: mdp, tel: tel, type: type, magasin: magasin)
        users += [user]
    }
    
    //MARK: - Edition d'un user
    func editUser(userItem : UserItem, value : Int) {
        users[users.firstIndex(where: {$0.id == userItem.id})!] = UserItem(id: userItem.id, avatar: userItem.avatar, identifiant: userItem.identifiant, nom: userItem.nom, prenom: userItem.prenom, rayon: userItem.rayon, mdp: userItem.mdp, tel: userItem.tel, type: userItem.type, magasin: userItem.magasin)
    }
    
    //MARK: - Suppression d'un user
    func deleteUser(userItem : UserItem) {
        users.remove(at: users.firstIndex(where: {$0.id == userItem.id})!)
    }
    
    
    init(){
        newUser(id: 1, avatar: "m8", identifiant: "TNebout", nom: "Nebout", prenom: "Thomas", rayon: "Maintenance", mdp: "Danstoncul@0503", tel: "0470462246", type: "Adjoint", magasin: "avermes")
        newUser(id: 2, avatar: "m14", identifiant: "NDevaux", nom: "Devaux", prenom: "Nicolas", rayon: "Maintenance", mdp: "Chefchauve@0503", tel: "0649777977", type: "Adjoint", magasin: "avermes")
        newUser(id: 3, avatar: "m16", identifiant: "JPOger", nom: "Oger", prenom: "Jean Paul", rayon: "Direction", mdp: "Jpoger@0503", tel: "0470462246", type: "Président Directeur Général", magasin: "avermes")
        newUser(id: 4, avatar: "f8", identifiant: "CMichaud", nom: "Michaud", prenom: "Claudette", rayon: "Administratif", mdp: "Motdepasse@03", tel: "0470462246", type: "Adjoint", magasin: "avermes")
        newUser(id: 5, avatar: "m1", identifiant: "FRenoux", nom: "Renoux", prenom: "Frédéric", rayon: "Service Après Vente", mdp: "renoux00", tel: "0470469195", type: "Employé", magasin: "avermes")
    }
}

//MARK: - Test
let testUserItem = UserItem(id: 1, avatar: "m8", identifiant: "TNebout", nom: "Nebout", prenom: "Thomas", rayon: "Maintenance", mdp: "Danstoncul@0503", tel: "0470462246", type: "Adjoint", magasin: "avermes")

