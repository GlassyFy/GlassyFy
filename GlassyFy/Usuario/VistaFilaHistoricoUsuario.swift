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
    @State var cancelar: Bool = true
    let fecha1 = DateFormatter()
    //fecha1.dateStyle = .short
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
        .ignoresSafeArea()
        .overlay(
            //NavigationView {
            HStack{
                //NavigationView {
                //Link (destination: VistaExperimentoUsuario(usuarioCurrent: vm.usuariosArray[0], experimentoCurrent: experimentoCurrent)) {
                NavigationLink (destination: VistaExperimentoUsuario(usuarioCurrent: vm.usuariosArray[0], experimentoCurrent: experimentoCurrent)) {
                    Image(systemName: "books.vertical.fill")
                        .resizable()
                        .frame(width: 37, height: 31)
                        .padding(5)  //spacing
                        .background(colorBlue)
                        .cornerRadius(10)
                        .offset(x:10, y:0)
                        //.onTapGesture {
                            //NavigationLink(<#LocalizedStringKey#>, destination: VistaExperimentoUsuario(usuarioCurrent: vm.usuariosArray[0], experimentoCurrent: //experimentoCurrent))
                        //}
                }
                //}
                //.navigationBarBackButtonHidden(true)
                VStack{
                  Text(experimentoCurrent.nombre!)
                    .font(.custom("Arial", size:20))
                  //Text("Fecha Creación: DD/MM/YY") //(String(experimentoCurrent.fechaToma))// fecha)
                    Text("Fecha Creación: \(fecha1.string(from: experimentoCurrent.fechaCreacion!))")
                    //Text("Fecha Creación: \(fecha1.string(from: experimentoCurrent.fechaCreacion!)!)")
                    .font(.custom("Arial", size:14))
                }
                .frame(width:189,  height:40, alignment: .leading)
                .offset(x:5, y:0)
                Spacer()
                //Image(uiImage: UIImage(data: vm.usuariosArray[0].foto!)!)//("foto")
                    //.frame(width:234, height:215)
                Button() {
                    mostrarConfirmarEliminarExperimento.toggle()
                    //VistaEliminacionExperimento (experimentoCurrent: experimentoCurrent)
                } label: {
                    Image(systemName: "trash.circle.fill")
                      .resizable()
                      .background(colorFondo)
                      .foregroundColor(colorRojoTxt)
                      .clipShape(Circle())
                      .frame(width: 40, height: 40)
                      .offset(x:-10, y:0)
                      .sheet (isPresented: $mostrarConfirmarEliminarExperimento,
                        onDismiss: {
                            if !cancelar {
                                                vm.deleteExperimento(experimento: experimentoCurrent )
                                }
                        }, content: {
                                            VistaEliminacionExperimento(experimentoCurrent: experimentoCurrent)
                        }
                      )
                }
            } //HStak
            .frame(width:389,  height:40, alignment: .center) // 439x65
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(colorStroke, lineWidth: 1))
            .background(colorRect)
            .foregroundColor(.white)
            //} //NavigationView
            //.navigationBarBackButtonHidden(true)
        )
    }
}

/*struct VistaFilaHistoricoUsuario_Previews: PreviewProvider {
      @StateObject private var vm: ViewModel = ViewModel()
      static var previews: some View {
          VistaFilaHistoricoUsuario(experimentoCurrent: vm.experimentosArray[0])
              .environmentObject(vm)   //Falla
       }
}*/
