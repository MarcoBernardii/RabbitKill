 //
//  StorageService.swift
//  RabbitKill
//
//  Created by Marco Bernardi on 05/04/2019.
//  Copyright © 2019 Marco Bernardi. All rights reserved.
//

import Foundation
class SalvaParametri
{
    
    static public func leggiStatoSuono() -> Bool
    {
        var stato=false
        if let statoSalvato = UserDefaults.standard.value(forKey: "StatoSuono") as? Bool
        {
            stato=statoSalvato
        }
        return stato
    }
    static public func salvaStatoSuono(statoAttuale: Bool)
    {
        UserDefaults.standard.set(statoAttuale, forKey: "StatoSuono")
    }
    
    static public func leggiParametro(nomeParametro: String) -> String
    {
        var parametro=""
        if let statoSalvato = UserDefaults.standard.string(forKey:nomeParametro)
        {
            parametro=statoSalvato
        }
        return parametro
    }
    
    static public func salvaParametro(nomeParametro: String,valore: String)
    {
        UserDefaults.standard.set(valore, forKey: nomeParametro)
    }
    static public func scoreBoardSave(first: Int, second: Int, third: Int){
        UserDefaults.standard.set(String(first), forKey: "first")
        UserDefaults.standard.set(String(second), forKey: "second")
        UserDefaults.standard.set(String(third), forKey: "third")
    }
    static public func scoreBoardRead() -> (String, String, String) {
        let first = leggiParametro(nomeParametro: "first") != "" ? leggiParametro(nomeParametro: "first") : "0"
        let second = leggiParametro(nomeParametro: "second") != "" ? leggiParametro(nomeParametro: "second") : "0"
        let third = leggiParametro(nomeParametro: "third") != "" ? leggiParametro(nomeParametro: "third") : "0"
        
        return ( first, second, third)
    }
}
