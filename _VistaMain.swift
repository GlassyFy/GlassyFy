//
//  VistaMain.swift
//  GlassyFy
//
//  Created by Antonio González Capel on 23/11/22.
//

import SwiftUI

var tabcolor = Color(red: 120/255, green: 57/255, blue: 62/255)

struct VistaMain: View {
    @EnvironmentObject var vm: ViewModel
    var usuarioCurrent: UsuarioEntity //PROPUESTA DE ÁNGEL
    @State var seleccion : Int = 0
    
    var colorSeleccion: Color = Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255)
    
    init(){
        UITabBar.appearance().barTintColor  = UIColor(red: 56/255, green: 57/255, blue: 62/255, alpha: 1)
        UITabBar.appearance().backgroundColor  = UIColor(red: 56/255, green: 57/255, blue: 62/255, alpha: 1)
    }
    
    
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
            .overlay(
        TabView(selection: $seleccion){
            NavigationView{
                AnadirDatosExpView()
            }.tabItem{
                Image(systemName: "list.bullet.rectangle.portrait")
                Text("Historial")
            }
            .tag(0)
            
            NavigationView{
                AnadirDatosExpView()
            }
                .tabItem{
                    Image(systemName: "note.text.badge.plus")
                    Text("Nuevo experimento")
                }
                .tag(1)
            NavigationView{
                AnadirDatosExpView()
            }
                .tabItem{
                    Image(systemName: "person.3")
                    Text("Usuarios")
                }
                .tag(2)

            VistaPerfilUsuario(usuarioCurrent: usuarioCurrent, foto: UIImage(data: usuarioCurrent.foto!)!).environmentObject(ViewModel())
                .tabItem{
                    //Label("Perfil", systemImage: "person.circle.fill")
                    Image(systemName: "person.circle.fill")
                    Text("Perfil Usuario")
                }
                .tag(3)
        }
        )
    }
}

struct VistaMain_Previews: PreviewProvider {
    static var previews: some View {
        VistaMain()
    }
}


extension UIImage {

   class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
    let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    color.setFill()
    UIRectFill(rect)
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return image
   }
}