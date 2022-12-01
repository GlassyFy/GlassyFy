//
//  NuevoExperimento.swift
//  GlassyFy
//
//  Created by Antonio González Capel on 18/11/22.
//

import SwiftUI

var colorFondo: Color = Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)

var colorboton: Color = Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255)

var colorcampostxt: Color = Color(red: 65 / 255, green: 68 / 255, blue: 74 / 255)

var rojotxt: Color = Color(red: 199 / 255, green: 73 / 255, blue: 69 / 255)

var rojoboton: Color = Color(red: 237 / 255, green: 106 / 255, blue: 94 / 255)

struct NuevoExperimentoView: View {
    
    var body: some View{
        NavigationView(){
            Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    VStack{
                    AnadirDatosExpA()
                    NavigationLink(destination: AnadirDatosViewA()){
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

struct AnadirDatosViewA: View {
    
    var body: some View{
        NavigationView(){
            Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    VStack{
                        AnadirDatosExpB()
                        
                        HStack{
                            
                            NavigationLink(destination:NuevoExperimentoView()){
                                Text("Volver atrás")
                                    .frame(width: 150, height: 55)
                                    .background(rojoboton)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                
                                NavigationLink(destination:AnadirDatosExpA()){
                                    Text("Siguiente")
                                        .frame(width: 150, height: 55)
                                        .background(colorboton)
                                        .foregroundColor(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
                                }
                            }
                        }
                    }
                )
        }.navigationBarBackButtonHidden(true)
    }
}


struct AnadirDatosExpA: View {
    @EnvironmentObject var vm: ViewModel
    @State var nombre: String = ""
    @State var fechaToma: Date = Date()
    @State var descripcion: String = ""
    
    
    var body: some View {
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
            .overlay(
                VStack{
                    Text("Datos tecnicos")
                        .font(.title)
                    Spacer()
                    VStack{
                        HStack{
                            Text("Nombre del experimento")
                                .font(.headline)
                            Spacer()
                        }
            
                        TextField("", text: $nombre)
                            .frame(height: 42)
                            .background(colorcampostxt)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundColor(.white)
                    }
                    HStack{
                        Text("Fecha de toma ")
                        Spacer()
                        DatePicker("", selection: $fechaToma, displayedComponents: .date)
                            //.colorMultiply(colorcampostxt)
                        .colorInvert()

                    }
                    
                    VStack{
                        HStack{
                            Text("Descripcion")
                            Spacer()
                            Text("x/x")
                                .foregroundColor(rojotxt)
                        }
                        VStack{
                            TextEditor(text: $descripcion)
                                .frame(height: 278)
                                .colorMultiply(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .foregroundColor(.black)
                            
                            Button("Limpiar datos"){
                                
                            }.foregroundColor(rojotxt)
                        }
                    }
                        
                        
                }.frame(width: 295)
                    .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
            )
        Spacer()
    }
}




struct AnadirDatosExpB: View {
    @State var parametro: Double = 0
    @EnvironmentObject var vm: ViewModel
    @State var indiceRef: Double = 0
    @State var magnesio: Double = 0
    @State var aluminio: Double = 0
    @State var potasio: Double = 0
    @State var calcio: Double = 0
    @State var bario: Double = 0
    
    
    var body: some View{
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
            .overlay(
                VStack{
                    Text("Datos de la muestra")
                        .font(.title)
                    VStack{
                        HStack{
                            Text("Índice de refracción (IR)")
                                .frame(width: 200, height: 37)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", indiceRef))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                        
                        HStack{
                            Text("Magnesio (Mg)")
                                .frame(width: 200, height: 37)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", magnesio))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                        
                        HStack{
                            Text("Aluminio (Al)")
                                .frame(width: 200, height: 37)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", aluminio))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                        
                        HStack{
                            Text("Potasio (K)")
                                .frame(width: 200, height: 37)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", potasio))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                        
                        HStack{
                            Text("Calcio (Ca)")
                                .frame(width: 200, height: 37)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", calcio))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                        
                        HStack{
                            Text("Bario (Ba)")
                                .frame(width: 200, height: 37)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", bario))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                        
                        Button("Limpiar datos"){
                            
                        }.foregroundColor(rojotxt)
                        
                        HStack{
                            Spacer()
                            Text("00.0")
                            Slider(value: $parametro, in: 0...40)
                            Text("00.0")
                            Spacer()
                        }.frame(width: 310, height: 50)
                            .background(colorcampostxt)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                }.frame(width: 295)
                    .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
            )
        Spacer()
    }
}


struct NuevoExperimentoView_Previews: PreviewProvider {
    static var previews: some View {
        AnadirDatosViewA()
    }
}
