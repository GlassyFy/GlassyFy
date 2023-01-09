//
//  GlassyFyApp.swift
//  GlassyFy
//
//  Created by Aula11 on 11/11/22.
//

import SwiftUI

/*
 MARK: TODOS LOS COLORES QUE USAMOS EN EL DESARROLLO DE LA APP
 */
var colorFondo: Color = Color(red: 48/255, green: 49/255, blue: 54/255)
var colorRect: Color = Color(red: 56/255, green: 57/255, blue: 62/255)
var colorcampostxt: Color = Color(red: 65 / 255, green: 68 / 255, blue: 74 / 255)
var colorBlue: Color = Color(red: 73/255, green: 82/255, blue: 189/255)  //var colorSeleccion
var colorGreen: Color = Color(red: 90/255, green: 163/255, blue: 100/255)
var colorStroke: Color = Color(red: 101/255, green: 101/255, blue: 101/255)
var colorLabel: Color = Color(red: 150/255, green: 152/255, blue: 157/255)
var colorRojoTxt: Color = Color(red: 199/255, green: 73/255, blue: 69/255) //var colorSalir
var colorRojoBoton: Color = Color(red: 237/255, green: 106/255, blue: 94/255) //var colorBTNSi
var colorboton: Color = Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255)
var rojotxt: Color = Color(red: 199 / 255, green: 73 / 255, blue: 69 / 255)
var rojoboton: Color = Color(red: 237 / 255, green: 106 / 255, blue: 94 / 255)
var contrariofondotxt: Color = Color(red: 190 / 255, green: 187 / 255, blue: 181 / 255)


@main
struct GlassyFyApp: App {
    @State var usuarioCurrent: UsuarioEntity = UsuarioEntity()
    @State var acceso:Bool = false
    init(){
        UITabBar.appearance().barTintColor  = UIColor(red: 56/255, green: 57/255, blue: 62/255, alpha: 1)
        UITabBar.appearance().backgroundColor  = UIColor(red: 56/255, green: 57/255, blue: 62/255, alpha: 1)
        UITableView.appearance().separatorStyle = .none
         UITableViewCell.appearance().backgroundColor = UIColor(red: 48 / 255, green: 49 / 255, blue: 54 / 255, alpha: 0)
         UITableView.appearance().backgroundColor = UIColor(red: 48 / 255, green: 49 / 255, blue: 54 / 255, alpha: 0)
        //UINavigationBar.appearance().barTintColor = .white
    }
    @StateObject var vm: ViewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            
            if(acceso == false){
                InicioView(usuarioCurrent: $usuarioCurrent, acceso: $acceso).environmentObject(vm)
            }
            if(acceso == true){
                VistaMain(acceso: $acceso, usuarioCurrent: $usuarioCurrent).environmentObject(vm)
            }
            //VistaMain().environmentObject(vm)
        }
    }
}
