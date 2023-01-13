//
//  InicioView.swift
//  GlassyFy
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI

struct InicioView: View {
    @Binding var usuarioCurrent: UsuarioEntity
    @Binding var acceso: Bool
    @EnvironmentObject var vm: ViewModel
    @State private var fadeInOut = false
    @State private var pushNuevaVista: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255).ignoresSafeArea()
                VStack{
                    Image("glaston_b2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height:300)
                        .opacity(0.5)
                }
                //Falta la animación de disolución o fade
                NavigationLink(destination: LoginView(acceso: $acceso, usuarioCurrent: $usuarioCurrent)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                               //.animation(.easeInOut(duration: 2.5))
                               ,isActive: $pushNuevaVista){
                    EmptyView()
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                pushNuevaVista = true
            }
        }
    }
}
//
//struct InicioView_Previews: PreviewProvider {
//    static var previews: some View {
//        InicioView()
//    }
//}
