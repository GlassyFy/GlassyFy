//
//  VistaHistorico.swift
//  GlassyFy
//
//  Created by Aula11 on 23/11/22.
//
import SwiftUI


struct VistaHistoricoGlobal: View {
    @EnvironmentObject var vm: ViewModel
    @Binding var usuarioCurrent: UsuarioEntity //= usuario
    @State var query: String = ""
    @State private var showingDeleteAlert = false
    @State private var itemToDelete: ExperimentoEntity? = nil
    
    
    
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
        .ignoresSafeArea()
        .overlay(
            GeometryReader{ gemr in
                VStack {
//                    HStack{
//                        Text("Histórico")
//                            .frame(alignment: .center)
//                            .foregroundColor(.white)
//                    }
//                    .frame(width:gemr.size.width  /*, height:37*/, alignment: .center)
//                    .background(colorRect)
//                    .font(.custom("Arial", size:24))
//                    .zIndex(3)
                    HStack{
                        BusquedaView(text: $query)  //llama a la subvista para BARRA DE BÚSQUEDA
                            .frame(width: gemr.size.width*0.9)
                    }.frame(height: gemr.size.height*0.1)
                    
                    ZStack{
                        List(){
                            ForEach(vm.experimentosArray){experimento in
                                if ((query.isEmpty || experimento.nombre!.contains(query))) {
                                //if (query.isEmpty || experimento.nombre!.contains(query)) {
                                    VistaFilaHistoricoUsuario(usuarioCurrent: usuarioCurrent, experimentoCurrent: experimento)
                                        .swipeActions {
                                                Button(role: .destructive) {
                                                    itemToDelete = experimento
                                                    showingDeleteAlert = true
                                                } label: {
                                                    Image(systemName: "trash.circle.fill")
                                                        .resizable()
                                                        .background(colorFondo)
                                                        .foregroundColor(colorRojoTxt)
                                                        .clipShape(Circle())
                                                        //.frame(width: 70, height: 70)
                                                }
                                        }
                                        .alert(isPresented:$showingDeleteAlert) {
                                            Alert(
                                                title: Text("¿Seguro desea eliminar el experimento?"),
                                                message: Text(itemToDelete!.nombre!),
                                                primaryButton: .destructive(Text("Sí").bold()) {
                                                    vm.deleteExperimento(experimento: itemToDelete!)
                                                },
                                                secondaryButton: .cancel(Text("No").bold())
                                            )
                                        }
                                }  //if
                            }.listRowBackground(colorFondo)
                                // ForEach
                        }// List
                        
                        .frame(height:gemr.size.height*0.8, alignment: .center)
                        .environment(\.defaultMinListRowHeight, 50)
                    }
                    
                    
                }// VStack
                
                .frame(height:gemr.size.height*0.8, alignment: .top)
            }.navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("Historico")
                
        )
    } // body
}
