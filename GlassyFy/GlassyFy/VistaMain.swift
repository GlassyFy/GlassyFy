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
    @State var seleccion : Int = 0
    
    var colorSeleccion: Color = Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255)
    
    init(){
        UITabBar.appearance().barTintColor  = UIColor(red: 56/255, green: 57/255, blue: 62/255, alpha: 1)
        UITabBar.appearance().backgroundColor  = UIColor(red: 56/255, green: 57/255, blue: 62/255, alpha: 1)
        UITableView.appearance().separatorStyle = .none
         UITableViewCell.appearance().backgroundColor = UIColor(red: 48 / 255, green: 49 / 255, blue: 54 / 255, alpha: 0)
         UITableView.appearance().backgroundColor = UIColor(red: 48 / 255, green: 49 / 255, blue: 54 / 255, alpha: 0)

    }
    
    
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
            .overlay(
        TabView(selection: $seleccion){
            
            //AAA
            NavigationView{
                AnadirDatosExpView()
            }.navigationBarHidden(true)
                .navigationBarTitle(Text("Título de la vista"), displayMode: .inline)
            .tabItem{
                Image(systemName: "list.bullet.rectangle.portrait")
            }
            .tag(0)
            
            //BBB
            NavigationView{
                AnadirDatosExpView()
            }
                .tabItem{
                    Image(systemName: "note.text.badge.plus")
                }
                .tag(1)
            
            //CCC
            NavigationView{
                AnadirDatosExpView()
            }
                .tabItem{
                    Image(systemName: "person.3")
                }
                .tag(2)

            //DDD
            NavigationView{
            VistaPerfilUsuario(usuarioCurrent: vm.usuariosArray[0]).environmentObject(ViewModel())
            }//.background(colorFondo)
                .tabItem{
                    //Label("Perfil", systemImage: "person.circle.fill")
                    Image(systemName: "person.circle.fill")
                }//.navigationTitle(vm.usuariosArray[0].nombre ?? "NOMBRE")
                .tag(4)
        }
        )
    }
}

//struct VistaMain_Previews: PreviewProvider {
//    static var previews: some View {
//        VistaMain()
//    }
//}


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
