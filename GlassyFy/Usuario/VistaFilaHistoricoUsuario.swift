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
    let fecha1 = DateFormatter()
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
            .overlay(
        
        
        HStack{
            Image(systemName: "books.vertical.fill")
                .resizable()
                .frame(width: 37, height: 31)
                .padding(5)  //spacing
                .background(colorBlue)
                .cornerRadius(10)
                .offset(x:-15, y:0)
            VStack(alignment: .leading){
                Text(experimentoCurrent.nombre!)
                    .frame(width: 305, alignment: .leading)
                    .font(.custom("Arial", size:20))
                    .multilineTextAlignment(.leading)
                Text("Fecha Creación: \(fecha1.string(from: experimentoCurrent.fechaCreacion!))")
                    .frame(width: 305, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .font(.custom("Arial", size:14))
            }
            //Spacer()
            Image(systemName: "trash.circle")
                .resizable()
                .frame(width: 40, height: 40)
                .background(colorRojoTxt)
                .foregroundColor(colorRect)
                .clipShape(Circle())
                .offset(x:-45, y:0)
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
        } //HStak
        .background(colorRect)
        .foregroundColor(.white)
        .frame(width: 409, height: 65, alignment: .leading)//439
        .offset(x:25, y:0)
        .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 2))
        
        
        )
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
