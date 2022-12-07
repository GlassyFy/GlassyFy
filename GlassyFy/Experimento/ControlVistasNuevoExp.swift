//
//  ControlVistasNuevoExp.swift
//  GlassyFy
//
//  Created by Antonio González Capel on 2/12/22.
//

import SwiftUI




struct NuevoExperimentoView: View {
    
    var body: some View{
        NavigationView(){
            Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    VStack{
                    AnadirDatosExpA()
                    NavigationLink(destination: AnadirDatosView()){
                        Text("Siguiente")
                            .frame(width: 100, height: 55)
                                .background(colorboton)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                }
                )
        }.navigationBarBackButtonHidden(true)
    }

    
}


struct AnadirDatosView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View{
        NavigationView(){
            Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    VStack{
                        AnadirDatosExpB()
                        
                        HStack{
                            
                                Button("Volver atrás"){
                                    presentation.wrappedValue.dismiss()
                                }
                                    .frame(width: 150, height: 55)
                                    .background(rojoboton)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                
                                NavigationLink(destination:RevisarExpDatosView()){
                                    Text("Siguiente")
                                        .frame(width: 150, height: 55)
                                        .background(colorboton)
                                        .foregroundColor(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
                                }
                            
                        }
                    }
                )
        }.navigationBarBackButtonHidden(true)
    }
}

struct RevisarExpDatosView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View{
        NavigationView(){
            Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    VStack{
                        Text("Repaso de la información")
                            .foregroundColor(.white)
                            .font(.custom("g" ,size: 26))
                        ScrollView(){
                            VStack{
                                RevisionDatosExp()
                            }.padding(400)
                            
                        }
                                HStack{
                                    Button("Volver atrás"){
                                        presentation.wrappedValue.dismiss()
                                    }
                                    .frame(width: 150, height: 55)
                                    .background(rojoboton)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    
                                    NavigationLink(destination:NuevoExperimentoView()){
                                        Text("Confirmar")
                                            .frame(width: 150, height: 55)
                                            .background(colorboton)
                                            .foregroundColor(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 30))
                                        
                                    }
                                }
                    }
                )
        }.navigationBarBackButtonHidden(true)
    }
}

struct popUpConfirmacion: View {
    
    
    var body: some View{
        ZStack{
            
        }
        Text("hi!")
    }
}


struct sNuevoExperimentoView_Previews: PreviewProvider {
    static var previews: some View {
        RevisarExpDatosView()
    }
}
