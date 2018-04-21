//
//  IonTools.swift
//  Chem Formula
//
//  Created by Zhang Bozheng on 9/4/16.
//  Copyright © 2016 ___ZHANG_BOZHENG___. All rights reserved.
//

import Foundation

class IonTools {
    func getException(var cation: String, var anion:String) -> Bool{
        if (anion.rangeOfString(cation) != nil){
            return true;
        }
        return false;
    }
    
    func getRepeated(var s0: String, var s1: String, var s2: String, var s3: String, var c: Int) -> Bool{
        
        switch c {
        case 0:
            return false
        case 1:
            if(s0 == s1){
                return true;
            }
            return false;
        case 2:
            if(s0 == s1 || s0 == s2 || s1 == s2){
                return true;
            }
            return false
        case 3:
            if(s0 == s1 || s0 == s2 || s0 == s3 || s1 == s2 || s1 == s3 || s2 == s3){
                return true;
            }
            return false;
        default:
            return false;
        }

    }
    
    func getHCF(var noOfCation: Int, var noOfAnion: Int) -> Int{
        
        for(var i = 2;i <= noOfCation||i <= noOfAnion; i++)
        {
            if(noOfCation % i == 0 && noOfAnion % i == 0)
            {
                print(i)
                return i;
            }
            
        }
        
        return 0;
        
    }
    
    func getSubscriptNumber(var number: Int) -> String{
        
        if(number == 1){
            return "";
        }
        
        if(number == 2){
            return "₂"
        }
        
        if(number == 3){
            return "₃"
        }
        
        if(number == 4){
            return "₄"
        }
        
        if(number == 5){
            return "₅"
        }
        
        if(number == 6){
            return "₆"
        }
        
        if(number == 7){
            return "₇"
        }
        
        return "";
        
    }
    
    func addCharge(charge: Int, positive: Int) -> String{
        
        if(Settings.showIonCharge == 1){
            if(positive == 0){
                
                if(charge == 1){
                    return "⁻"
                }
                if(charge == 2){
                    return "²⁻"
                }
                if(charge == 3){
                    return "³⁻"
                }
                if(charge == 4){
                    return "⁴⁻"
                }
                
            }
            if(positive == 1){
                
                if(charge == 1){
                    return "⁺"
                }
                if(charge == 2){
                    return "²⁺"
                }
                if(charge == 3){
                    return "³⁺"
                }
                if(charge == 4){
                    return "⁴⁺"
                }
                if(charge == 5){
                    return "⁵⁺"
                }
                if(charge == 6){
                    return "⁶⁺"
                }
                if(charge == 7){
                    return "⁷⁺"
                }
                
            }
        }
        
        return "";
        
    }
    
    func getNoOfCapitalLetters(var input: String) -> Int{
        
        let string = input
        var output = ""
        
        for chr in string.characters {
            var str = String(chr)
            if str.lowercaseString != str {
                output += str
            }
        }
        
        return(output.characters.count)
        
    }
}
