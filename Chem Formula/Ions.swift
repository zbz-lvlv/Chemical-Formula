//
//  Ions.swift
//  Chem Formula
//
//  Created by ZBZ on 18/12/15.
//  Copyright © 2015 ___ZHANG_BOZHENG___. All rights reserved.
//

import Foundation

class Ions{

    //create a multidimensional String array][for Group I to Group VII
    //1. chemicals in the group
    //2. special chemicals NH4+
    //3. transition metals
    var cationNames = [[String]]()

    //create a multidimensional String array][for Group I to Group VII
    //1. chemicals in the group
    //2. special chemicals NH4+
    //3. transition metals
    var anionNames = [[String]]()

    //create a multidimensional String array][for Group V to Group VII
    //1. chemicals in the group
    //2. special chemicals SO42-
    var cationSymbols = [[String]]()

    //create a multidimensional String array][for Group V to Group VII
    //1. chemicals in the group
    //2. special chemicals SO42-
    var anionSymbols = [[String]]();

    func initializeNullValues(){
        
        var cationNamesSingle = [String]();
        for(var c = 0; c < Int(Settings.noOfCationGrp[2]); c += 1){
            cationNamesSingle.append("")
        }
        
        for(var c = 0; c < Int(Settings.noOfCationSeq[2]);c += 1){
            cationNames.append(cationNamesSingle);
        }
        
        var anionNamesSingle = [String]();
        for(var c = 0; c < Int(Settings.noOfAnionGrp[2]); c += 1){
            anionNamesSingle.append("")
        }
        
        for(var c = 0; c < Int(Settings.noOfAnionSeq[2]); c += 1){
            anionNames.append(anionNamesSingle);
        }
        
        var cationSymbolsSingle = [String]();
        for(var c = 0; c < Int(Settings.noOfCationGrp[2]); c += 1){
            cationSymbolsSingle.append("")
        }
        
        for(var c = 0; c < Int(Settings.noOfCationSeq[2]);c += 1){
            cationSymbols.append(cationSymbolsSingle);
        }
        
        var anionSymbolsSingle = [String]();
        for(var c = 0; c < Int(Settings.noOfAnionGrp[2]); c += 1){
            anionSymbolsSingle.append("")
        }
        
        for(var c = 0; c < Int(Settings.noOfAnionSeq[2]); c += 1){
            anionSymbols.append(anionSymbolsSingle);
        }
        
    }

    func createCation(){
        
        //group I
        cationNames[0][0] = "lithium"; //lv 1
        cationNames[1][0] = "sodium";
        cationNames[2][0] = "potassium";
        cationNames[3][0] = "hydrogen";
        cationNames[7][0] = "rubidium"; //lv 2
        cationNames[8][0] = "caesium";
        cationNames[9][0] = "francium";
        cationNames[10][0] = "ammonium";
        cationNames[11][0] = "copper(I)";
        cationNames[12][0] = "silver";
        
        cationSymbols[0][0] = "Li"; //lv 1
        cationSymbols[1][0] = "Na";
        cationSymbols[2][0] = "K";
        cationSymbols[3][0] = "H";
        cationSymbols[7][0] = "Rb"; //lv 2
        cationSymbols[8][0] = "Cs";
        cationSymbols[9][0] = "Fr";
        cationSymbols[10][0] = "NH₄";
        cationSymbols[11][0] = "Cu";
        cationSymbols[12][0] = "Ag";
        
        //group II
        cationNames[0][1] = "beryllium"; //lv 1
        cationNames[1][1] = "magnesium";
        cationNames[2][1] = "barium";
        cationNames[3][1] = "lead(II)";
        cationNames[4][1] = "calcium";
        cationNames[5][1] = "copper(II)";
        cationNames[6][1] = "iron(II)";
        cationNames[7][1] = "strontium"; //lv 2
        cationNames[8][1] = "radium";
        cationNames[9][1] = "zinc";
        cationNames[10][1] = "vanadium(II)";
        cationNames[11][1] = "chromium(II)";
        cationNames[12][1] = "manganese(II)";
        cationNames[13][1] = "cobalt(II)";
        cationNames[14][1] = "nickel(II)";
        
        cationSymbols[0][1] = "Be"; //lv 1
        cationSymbols[1][1] = "Mg";
        cationSymbols[2][1] = "Ba";
        cationSymbols[3][1] = "Pb";
        cationSymbols[4][1] = "Ca";
        cationSymbols[5][1] = "Cu";
        cationSymbols[6][1] = "Fe";
        cationSymbols[7][1] = "Sr"; //lv 2
        cationSymbols[8][1] = "Ra";
        cationSymbols[9][1] = "Zn";
        cationSymbols[10][1] = "V";
        cationSymbols[11][1] = "Cr";
        cationSymbols[12][1] = "Mn";
        cationSymbols[13][1] = "Co";
        cationSymbols[14][1] = "Ni";
        
        //group III
        cationNames[0][2] = "aluminium"; //lv 1
        cationNames[1][2] = "gallium";
        cationNames[7][2] = "boron"; //lv 2
        cationNames[8][2] = "indium";
        cationNames[9][2] = "thallium";
        cationNames[10][2] = "iron(III)";
        cationNames[11][2] = "scandium(III)";
        cationNames[12][2] = "vanadium(III)";
        cationNames[13][2] = "chromium(III)";
        cationNames[14][2] = "manganese(III)";
        cationNames[15][2] = "cobalt(III)";
        cationNames[16][2] = "phosphorus(III)"
        
        cationSymbols[0][2] = "Al"; //lv 1
        cationSymbols[1][2] = "Ga";
        cationSymbols[7][2] = "B"; //lv 2
        cationSymbols[8][2] = "In";
        cationSymbols[9][2] = "Tl";
        cationSymbols[10][2] = "Fe";
        cationSymbols[11][2] = "Sc";
        cationSymbols[12][2] = "V";
        cationSymbols[13][2] = "Cr";
        cationSymbols[14][2] = "Mn";
        cationSymbols[15][2] = "Co";
        cationSymbols[16][2] = "P";
        
        //charge 4+
        cationNames[0][3] = "titanium(IV)";
        cationNames[1][3] = "vanadium(IV)";
        cationNames[2][3] = "manganese(IV)";
        
        cationSymbols[0][3] = "Ti";
        cationSymbols[1][3] = "V";
        cationSymbols[2][3] = "Mn";
        
        //charge 5+
        cationNames[0][4] = "vanadium(V)";
        cationNames[1][4] = "phosphorus(V)"
        
        cationSymbols[0][4] = "V";
        cationSymbols[1][4] = "P";
        
        //charge 6+
        cationNames[0][5] = "chromium(VI)";
        cationNames[1][5] = "manganese(VI)";
        
        cationSymbols[0][5] = "Cr";
        cationSymbols[1][5] = "Mn";
        
        //charge 7+
        cationNames[0][6] = "vanadium(VII)";
        
        cationSymbols[0][6] = "V";
    }

    func getCationName(var sequence: Int, var group: Int) -> String{
        return cationNames[sequence][group];
    }

    func getCationSymbol(var sequence: Int, var group: Int) -> String{
        return cationSymbols[sequence][group];
    }

    func createAnion(){
        
        //1-
        anionNames[0][0] = "fluoride"; //lv 1
        anionNames[1][0] = "chloride";
        anionNames[2][0] = "bromide";
        anionNames[3][0] = "iodide";
        anionNames[4][0] = "nitrate";
        anionNames[5][0] = "hydroxide";
        anionNames[6][0] = "astatide"; //lv 2
        anionNames[7][0] = "hydride";
        anionNames[8][0] = "manganate(VII)";
        anionNames[9][0] = "bicarbonate";
        anionNames[10][0] = "nitrite";
        anionNames[11][0] = "chlorate"; //lv 3
        anionNames[12][0] = "chlorite";
        anionNames[13][0] = "bromate";
        anionNames[14][0] = "bromite";
        anionNames[15][0] = "iodate";
        anionNames[16][0] = "iodite";
        anionNames[17][0] = "acetate";
        anionNames[18][0] = "hypochlorite";
        anionNames[19][0] = "perchlorate";
        anionNames[20][0] = "cyanide";
        anionNames[21][0] = "binoxalate";
        anionNames[22][0] = "hypoiodite";
        anionNames[23][0] = "amide";
        anionNames[24][0] = "thiocyanate";
        
        anionSymbols[0][0] = "F"; //lv 1
        anionSymbols[1][0] = "Cl";
        anionSymbols[2][0] = "Br";
        anionSymbols[3][0] = "I";
        anionSymbols[4][0] = "NO₃";
        anionSymbols[5][0] = "OH";
        anionSymbols[6][0] = "At"; //lv 2
        anionSymbols[7][0] = "H";
        anionSymbols[8][0] = "MnO₄";
        anionSymbols[9][0] = "HCO₃";
        anionSymbols[10][0] = "NO₂";
        anionSymbols[11][0] = "ClO₃"; //lv 3
        anionSymbols[12][0] = "ClO₂";
        anionSymbols[13][0] = "BrO₃";
        anionSymbols[14][0] = "BrO₂";
        anionSymbols[15][0] = "IO₃";
        anionSymbols[16][0] = "IO₂";
        anionSymbols[17][0] = "CH₃COO";
        anionSymbols[18][0] = "ClO";
        anionSymbols[19][0] = "ClO₄";
        anionSymbols[20][0] = "CN";
        anionSymbols[21][0] = "HC₂O₄";
        anionSymbols[22][0] = "IO";
        anionSymbols[23][0] = "NH₂";
        anionSymbols[24][0] = "SCN";
        
        //2-
        anionNames[0][1] = "oxide"; //lv 1
        anionNames[1][1] = "sulfide";
        anionNames[2][1] = "carbonate";
        anionNames[3][1] = "sulfate";
        anionNames[6][1] = "selenide"; //lv 2
        anionNames[7][1] = "telluride";
        anionNames[8][1] = "polonide";
        anionNames[9][1] = "dichromate(VI)";
        anionNames[10][1] = "sulfite";
        anionNames[11][1] = "selenate"; //lv 3
        anionNames[12][1] = "selenite";
        anionNames[13][1] = "thiosulfate";
        anionNames[14][1] = "silicate";
        anionNames[15][1] = "tartrate";
        
        anionSymbols[0][1] = "O"; //lv 1
        anionSymbols[1][1] = "S";
        anionSymbols[2][1] = "CO₃";
        anionSymbols[3][1] = "SO₄";
        anionSymbols[6][1] = "Se"; //lv 2
        anionSymbols[7][1] = "Te";
        anionSymbols[8][1] = "Po";
        anionSymbols[9][1] = "Cr₂O₇";
        anionSymbols[10][1] = "SO₃";
        anionSymbols[11][1] = "SeO₄"; //lv 3
        anionSymbols[12][1] = "SeO₃";
        anionSymbols[13][1] = "S₂O₃";
        anionSymbols[14][1] = "SiO₃";
        anionSymbols[15][1] = "C₄H₄O₆";
        
        //3-
        anionNames[0][2] = "nitride"; //lv 1
        anionNames[1][2] = "phosphide";
        anionNames[6][2] = "arsenide"; //lv 2
        anionNames[7][2] = "antimonide";
        anionNames[8][2] = "phosphate";
        anionNames[11][2] = "phosphite"; //lv 3
        anionNames[12][2] = "arsenate";
        anionNames[13][2] = "borate";
        
        anionSymbols[0][2] = "N"; //lv 1
        anionSymbols[1][2] = "P";
        anionSymbols[6][2] = "As"; //lv 2
        anionSymbols[7][2] = "Sb";
        anionSymbols[8][2] = "PO₄";
        anionSymbols[11][2] = "PO₃"; //lv 3
        anionSymbols[12][2] = "AsO₄";
        anionSymbols[13][2] = "BO₃";
        
        //4-
        anionNames[0][3] = "pyrophosphate";
        anionSymbols[0][3] = "P₂O₇"
        
    }

    func getAnionName(var sequence: Int, var group: Int) -> String{
        return anionNames[sequence][group];
    }

    func getAnionSymbol(var sequence: Int, var group: Int) -> String{
        return anionSymbols[sequence][group];
    }

}



