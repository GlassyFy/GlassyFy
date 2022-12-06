//
//  VistaHistorico.swift
//  GlassyFy
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI

struct VistaHistoricoUsuario: View {
  @EnvironmentObject var vm: ViewModel
  //let usuario: UsuarioEntity //= vm.usuariosArray[0]
  var usuarioCurrent: UsuarioEntity //= usuario
  @State var query: String = ""
  @State var enEdicion: Bool = false
  var body: some View {
      Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
          .ignoresSafeArea()
          .overlay(
      
      
    NavigationView{
      VStack {
        BusquedaView(text: $query)  //llama a la subvista para BARRA DE BÚSQUEDA
        List(){
          ForEach(vm.experimentosArray){experimento in
              if (query.isEmpty || experimento.nombre!.contains(query)) {
                //NavigationLink(destination: VistaDetalleExperimentoUsuarioLogueado(usuarioCurrent: usuario, experimentoCurrent: experimento)){
                VistaFilaHistoricoUsuario(experimentoCurrent: experimento)
              }  //if
          } // ForEach
          //.onDelete (perform: vm.deleteExperimento)  //ELIMINANDO REGISTROS
        }// List
        .background(colorFondo)
        .navigationBarBackButtonHidden(true)
        //.navigationTitle("Tu Histórico") //List
        .navigationBarItems( // Lista en modo Edición
          leading:  //parte izquierda
              Button(){
                  enEdicion.toggle()
              }
              label:{
              Text(enEdicion ? "Cancelar" : "Editar")
                  .font(.title)
                  .foregroundColor(Color.blue)
                  .shadow(color: Color(red: 0.28, green: 0.855, blue: 0.92), radius:9)
            })//fin de .navigationBarItems
        .environment(\.editMode, .constant(enEdicion ? EditMode.active : EditMode.inactive))
        //Fin de List
      }// VStack
      .background(colorFondo)
    } // NavigationView
      
      
    )
  } // body
}

struct BusquedaView: View {   // Subvista BARRA DE BÚSQUEDA   EJERCICIO 2
    @Binding var text: String
    @EnvironmentObject var vm: ViewModel // No se si esta bien
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
            .overlay(
        
        HStack{
            Image(systemName: "magnifyingglass.circle")
                .resizable()
                .frame(width: 34, height: 33)
                //.padding(5)  //spacing
                //.background(colorBlue)
            
            
                .foregroundColor(text.isEmpty ?
                    Color(UIColor.gray).opacity(0.4) : Color(UIColor.gray).opacity(0.9))
            TextField("Buscar experimento...", text:$text)
                .font(.custom("Arial", size:24))
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
            Button(){
                text = ""
            }label:{
                Image(systemName: "x.circle")
            }
            .opacity(text.isEmpty ? 0.0 : 1.0)   // Desaparece o aparece el botón
        } //HStack
        .frame(width: 350, height: 50, alignment:.center)
        .background(colorRect)
        .foregroundColor(.white)
        .clipShape(Rectangle()) //.clipShape(Circle())
        .shadow(color: colorStroke, radius:2)
        
        )
    }
}

/*struct VistaHistoricoUsuario_Previews: PreviewProvider {
  @StateObject private var vm: ViewModel = ViewModel()
  static var previews: some View {
    VistaHistoricoUsuario(usuarioCurrent: vm.usuariosArray[0])
      .environmentObject(vm)
  }
}*/

/*
struct VistaFila: View {
  var experimentoCurrent: Experimento
  var body: some View {
      HStack{
        Image(systemName: "books.vertical")
              .background(.blue)
              .offset(x:-25, y:0)
        VStack(alignment: .leading){
            Text(experimentoCurrent.nombre)
              .font(.subheadline)
              .fontWeight(.bold)
              .foregroundColor(Color.green)
            Text(experimentoCurrent.fecha)
              .font(.caption2)
              .fontWeight(.medium)
        }
        /*Spacer()
        Image(systemName: "trash.circle")
              .background(.red)
              .offset(x:25, y:0)*/
      }
      .background(Color.gray)
      .foregroundColor(.white)
  }
}

struct VistaFila_Previews: PreviewProvider {
    static var previews: some View {
       // List(ViewModel().datos){ // List(ModeloDatos().arrExperimentos){
           // VistaFila(experimentoCurrent: $0)
        //}
       List(ViewModel()){ // List(ModeloDatos().arrExperimentos){
           VistaFila(experimentoCurrent: $0)
       }
    }
}*/
