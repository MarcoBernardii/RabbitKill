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
    static public func scoreBoardSave(first: Int, second: Int, third: Int, fname: String, sname: String, tname: String){
        UserDefaults.standard.set(String(first), forKey: "first")
        UserDefaults.standard.set(String(second), forKey: "second")
        UserDefaults.standard.set(String(third), forKey: "third")
        UserDefaults.standard.set(String(fname), forKey: "fname")
        UserDefaults.standard.set(String(sname), forKey: "sname")
        UserDefaults.standard.set(String(tname), forKey: "tname")
    }
    static public func scoreBoardRead() -> (String, String, String, String, String, String) {
        let first = leggiParametro(nomeParametro: "first") != "" ? leggiParametro(nomeParametro: "first") : "0"
        let second = leggiParametro(nomeParametro: "second") != "" ? leggiParametro(nomeParametro: "second") : "0"
        let third = leggiParametro(nomeParametro: "third") != "" ? leggiParametro(nomeParametro: "third") : "0"
        let fname = leggiParametro(nomeParametro: "fname") != "" ? leggiParametro(nomeParametro: "fname") : "Vuoto"
        let sname = leggiParametro(nomeParametro: "sname") != "" ? leggiParametro(nomeParametro: "sname") : "Vuoto"
        let tname = leggiParametro(nomeParametro: "tname") != "" ? leggiParametro(nomeParametro: "tname") : "Vuoto"
        return ( first, second, third, fname, sname, tname)
    }
}
