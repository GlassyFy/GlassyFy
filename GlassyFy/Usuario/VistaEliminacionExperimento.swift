//
//  VistaEliminacionExperimento.swift
//  GlassyFy
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI



struct VistaEliminacionExperimento: View {
    @EnvironmentObject var vm: ViewModel
    var experimentoCurrent: ExperimentoEntity
    @Binding var cancelar: Bool
    @Environment(\.presentationMode) var modoPresentacion
    let fecha1 = DateFormatter()
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
        .ignoresSafeArea()
        .overlay(
        VStack {
            Text("¿Seguro desea eliminar el experimento?")
                .frame(width: 215, height: 47, alignment: .center)//355
                .font(.custom("Arial", size:20))
                .multilineTextAlignment(.center)
                .offset(x:0, y:-30)
            HStack{ //Datos del experimento
                Image(systemName: "books.vertical.fill")
                  .resizable()
                  .frame(width: 37, height: 31)
                  .padding(5)
                  .background(colorBlue)
                  .cornerRadius(10)

                VStack(alignment: .leading){
                    Text(experimentoCurrent.nombre ?? "nombreEXP")
                        .frame(width: 305, alignment: .center)
                        .font(.custom("Arial", size:20))
                        .multilineTextAlignment(.center)
                    Text("Fecha Creación: \(fecha1.string(from: experimentoCurrent.fechaCreacion!))")
                        .frame(width: 305, alignment: .center)
                        .multilineTextAlignment(.center)
                        .font(.custom("Arial", size:14))
                }
                .frame(width: 305, alignment: .center)
                .offset(x:10, y:0)
                .multilineTextAlignment(.center)
            }
            .background(colorRect)
            .foregroundColor(.white)
            .frame(width: 409, height: 65, alignment: .leading)//439
            .offset(x:25, y:0)
            .overlay(RoundedRectangle(cornerRadius:10).stroke(colorStroke, lineWidth: 2))
            
            HStack{  //Botones
                Button() {
                    cancelar = true
                    modoPresentacion.wrappedValue.dismiss()
                } label: {
                    Text("No").bold()
                        .frame(width: 176, height: 24, alignment: .center)
                        .font(.custom("Arial", size:20))
                }
                .frame(width: 130, height: 33, alignment: .center)
                .padding()
                .background(colorBlue)
                .clipShape(Capsule())

                Spacer()

                Button() {
                    cancelar = false
                    modoPresentacion.wrappedValue.dismiss()
                } label: {
                    Text("Sí").bold()
                        .frame(width: 176, height: 24, alignment: .center)
                        .font(.custom("Arial", size:20))
                }
                .frame(width: 130, height: 33, alignment: .center)//170X53
                .padding()
                .background(colorRojoBoton)
                .clipShape(Capsule())
            } //HStack
            .frame(width: 360, height: 53, alignment: .center) //400
            .offset(x:0, y:25)
            .font(.custom("Arial", size:20)) //.font(.largeTitle)
        } //VStack
        .frame (width: 425, height: 307, alignment: .center) //(width: 455, height: 307
        .overlay(RoundedRectangle(cornerRadius:15).stroke(colorStroke, lineWidth: 2))
        .background(colorRect)
        .foregroundColor(.white)
        )
    }
    
}

/*struct VistaEliminacionExperimento_Previews: PreviewProvider {
      @EnvironmentObject var vm: ViewModel
      static var previews: some View {
          VistaEliminacionExperimento (experimentoCurrent: vm.experimentosArray[3])
              .environmentObject(vm)   //Falla
       }
}*/


