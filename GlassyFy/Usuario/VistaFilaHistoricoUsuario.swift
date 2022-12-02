//
//  VistaFilaExperimento.swift
//  GlassyFy
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI

struct VistaFilaHistoricoUsuario: View {
    @EnvironmentObject var vm: ViewModel
    var experimentoCurrent: ExperimentoEntity
    @State var mostrarConfirmarEliminarExperimento: Bool = false
    @State var cancelConfirmar: Bool = true
    var body: some View {
        HStack{
          Image(systemName: "books.vertical")
                .background(.blue)
                .offset(x:-25, y:0)
          VStack(alignment: .leading){
              Text(experimentoCurrent.nombre!)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color.green)
              Text("Fecha de toma") //(String(experimentoCurrent.fechaToma))// fecha)
                .font(.caption2)
                .fontWeight(.medium)
          }
          Spacer()
          Image(systemName: "trash.circle")
                .background(.red)
                .offset(x:25, y:0)
                .onTapGesture {
                  mostrarConfirmarEliminarExperimento.toggle()
                  //NavigationLink (VistaEliminacionFilaHistoricoUsuarioLogueado(experimentoCurrent: experimentoCurrent))
                }
                .sheet(isPresented: $mostrarConfirmarEliminarExperimento,
                  onDismiss: {
                         if !cancelConfirmar {
   //vm.addMascota(persona: persona, nombre: nombre.isEmpty ? "nueva mascota" : nombre,
                 //edad: edad.isEmpty ? 1 : Int16(double_edad), raza: raza.isEmpty ? "Perro" : "Gato") //raza: raza == 0 ? "Perro" : "Gato")
   //vm.deleteExperimento(experimento: experimentoCurrent )
                         }
                      }, content: {
                             //AddMascotaView (persona: $persona, nombre: $nombre, edad: $edad, raza: $raza, cancelar: $cancelAddMascota)
  // VistaEliminacionFilaHistoricoUsuarioLogueado (experimentoCurrent: $experimentoCurrent)
                      }  //onDismiss
                  )
        }
        .background(Color.gray)
        .foregroundColor(.white)
    }
  }

/*struct VistaFilaHistoricoUsuario_Previews: PreviewProvider {
    static var previews: some View {
        // List(ViewModel().datos){ // List(ModeloDatos().arrExperimentos){
            // VistaFila(experimentoCurrent: $0)
         //}
        List(ViewModel()){ // List(ModeloDatos().arrExperimentos){
            VistaFilaHistoricoUsuario(experimentoCurrent: $0)
        }
     }
 } */
