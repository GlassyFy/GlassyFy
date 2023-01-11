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

                    HStack{
                        BusquedaView(text: $query)  //llama a la subvista para BARRA DE BÚSQUEDA
                            .frame(width: gemr.size.width*0.9)
                    }.frame(height: gemr.size.height*0.1)
                    
                    ZStack{
                        List(){
                            ForEach(vm.experimentosArray){experimento in
                                if (query.isEmpty || (experimento.nombre!.lowercased().starts(with: query.lowercased()))) {
                                    
                                    VistaFilaHistoricoUsuario(usuarioCurrent: usuarioCurrent, experimentoCurrent: experimento).frame(width: gemr.size.width*0.87)
                                            .offset(x: -gemr.size.width*0.03)
                                }  //if
                            }.listRowBackground(colorFondo)
                                // ForEach
                        }// List
                        
                        .frame(width:gemr.size.width, height:gemr.size.height*0.9, alignment: .center)
                        .environment(\.defaultMinListRowHeight, 60)
                    }
                    
                    
                }// VStack
                
                .frame(width:gemr.size.width,height:gemr.size.height*0.8, alignment: .top)
            }.navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("Historico")
                
        )
    } // body
}
