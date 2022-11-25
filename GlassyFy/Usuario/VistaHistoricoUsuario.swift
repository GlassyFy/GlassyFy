//
//  VistaHistorico.swift
//  GlassyFy
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI
/*
struct VistaHistoricoUsuario: View {
    @EnvironmentObject var vm: ViewModel
    //let usuario: UsuarioEntity = vm.usuariosArray[0]
    //var usuarioCurrent: UsuarioEntity = usuario
    @State var query: String = ""
    @State var enEdicion: Bool = false
   var body: some View {
      NavigationView{
        VStack {
          BusquedaView(text: $query)  //llama a la subvista para BARRA DE BÚSQUEDA
          List(){
            //Toggle(isOn: $soloFavoritos){
            //  Text("Mostrar solo los favoritos")
            //}
            ForEach(vm.experimentosArray){experimento in
              if (query.isEmpty || experimento.nombre.contains(query)) {
                  NavigationLink(destination: VistaExperimentoUsuario(usuarioCurrent: usuarioCurrent,
                  experimentoCurrent: experimento)){
                  VistaFilaHistoricoUsuario(experimentoCurrent: experimento)
                }
              }  //if
            } // ForEach
            .onDelete {indexSet in  //ELIMINANDO REGISTROS
                //experimentoVM.datos.remove(atOffsets: indexSet)
            }
            //.onMove {indexSet, newOffSet in  //MOVIENDO REGISTROS
                 //amigoVM.datos.move(fromOffsets: indexSet, toOffset: newOffSet)
            //}
          } // List
          .navigationTitle("Tu Histórico") //List
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
            /*    },
            trailing: //parte derecha
              Button(){  // Boton +
                  mostrarAddAmigo.toggle()
                  nombre = ""
                  telefono = ""
                  email = ""
                  imagenID = "Person"  //la imagen que sea
              }
              label: {
                Image(systemName: "plus.circle")
                  .font(.title)
                  .foregroundColor(Color.red)
                  .shadow(color: Color.pink, radius:9)*/
              }
              /*.sheet(isPresented: $mostrarAddAmigo,
                onDismiss: {
                    if !cancelarAdd {
                        amigoVM.datos.append(Amigo(nombre: nombre.isEmpty ? "nuevoAmigo" : nombre,
                           telefono: telefono.isEmpty ? "777777777" : telefono,
                           email: email.isEmpty ? "nuevoAmigo@gmailing.com" : email,
                           imagenID: imagenID))
                    }
                }, content: {
                    VistaAddAmigo(nombre: $nombre, telefono: $telefono, email: $email, imagenID:
                        $imagenID, cancelar: $cancelarAdd)
              })*/
          )//fin de .navigationBarItems
          //asociar enEdicion con el estado de la vista
          .environment(\.editMode, .constant(enEdicion ? EditMode.active : EditMode.inactive))
          //Fin de List
        } // VStack
      } // NavigationView
    } // body
  }

struct VistaHistorico_Previews: PreviewProvider {
    static var previews: some View {
        VistaHistoricoUsuario()
            .environmentObject(ViewModel())
    }
}

struct BusquedaView: View {   // Subvista BARRA DE BÚSQUEDA   EJERCICIO 2
    @Binding var text: String
    @EnvironmentObject var vm: ViewModel // No se si esta bien
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(text.isEmpty ?
                    Color(UIColor.gray).opacity(0.4) : Color(UIColor.gray).opacity(0.9))
            TextField("Buscar experimento...", text:$text)
            Button(){
                text = ""
            }label:{
                Image(systemName: "x.circle")
            }
            .opacity(text.isEmpty ? 0.0 : 1.0)   // Desaparece o aparece el botón
        } //HStack
        .frame(width: 350, height: 50, alignment:.center)
        .background(Color.teal)
        .foregroundColor(.black)
        .clipShape(Rectangle()) //.clipShape(Circle())
        .shadow(color: Color.red, radius:2)
    }
}
*/
