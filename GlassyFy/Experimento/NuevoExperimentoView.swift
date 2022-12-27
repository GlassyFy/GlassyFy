//
//  NuevoExperimento.swift
//  GlassyFy
//
//  Created by Antonio González Capel on 18/11/22.
//

import SwiftUI

//var colorFondo: Color = Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)

var colorboton: Color = Color(red: 73 / 255, green: 82 / 255, blue: 189 / 255)

//var colorcampostxt: Color = Color(red: 65 / 255, green: 68 / 255, blue: 74 / 255)

var rojotxt: Color = Color(red: 199 / 255, green: 73 / 255, blue: 69 / 255)

var rojoboton: Color = Color(red: 237 / 255, green: 106 / 255, blue: 94 / 255)

/*
 *
 Primera vista para anadir datos
 *
 */
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
                    Spacer()
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
                        Text("Fecha de toma")
                        Spacer()
                        DatePicker("", selection: $fechaToma, displayedComponents: .date)
                        .colorInvert()

                    }
                    
                    VStack{
                        HStack{
                            Text("Descripcion")
                            Spacer()
                            Text("\(descripcion.count)/300")
                                .foregroundColor(rojotxt)
                        }
                        VStack{
//                            if #available(iOS 16.0, *) {
//                                TextEditor(text: $descripcion)
//                                    .scrollContentBackground(.hidden)
//                                    .frame(height: 278)
//                                    .background(colorcampostxt)
//                                    .clipShape(RoundedRectangle(cornerRadius: 15))
//                                    .onChange(of: self.descripcion){ value in
//                                        if Int(descripcion.count) > 300 {
//                                            self.descripcion = String(value.prefix(300))
//                                        }
//                                    }
//                            } else {
                                TextEditor(text: $descripcion)
                                    .frame(height: 278)
                                    .background(colorcampostxt)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                    .onChange(of: self.descripcion){ value in
                                        if Int(descripcion.count) > 300 {
                                            self.descripcion = String(value.prefix(300))
                                        }
                                    }
//                            }
                                
                            
                            Button("Limpiar datos"){
                                descripcion = ""
                                fechaToma = Date()
                                nombre = ""
                                
                            }.foregroundColor(rojotxt)
                        }
                    }
                        
                        
                }.frame(width: 295)
                    .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
            )
        Spacer()
    }
}

/*
 *
 Segunda vista para anadir datos
 *
 */

struct AnadirDatosExpB: View {
    @EnvironmentObject var vm: ViewModel
    @State var parametro: Double = 0
    
    @State var indiceRef: Double = 0
    @State var selectIR: Bool = false
    
    @State var magnesio: Double = 0
    @State var selectMG: Bool = false
    
    @State var aluminio: Double = 0
    @State var selectAL: Bool = false
    
    @State var potasio: Double = 0
    @State var selectK: Bool = false
    
    @State var calcio: Double = 0
    @State var selectCa: Bool = false
    
    @State var bario: Double = 0
    @State var selectBa: Bool = false
    
    @State var minValue: Double = 0
    @State var maxValue: Double = 0
    
    var body: some View{
        Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255)
            .ignoresSafeArea()
            .overlay(
                VStack{
                    Spacer()
                    Text("Datos de la muestra")
                        .font(.title)
                    Spacer()
                    VStack{
                        HStack{
                            Text("Índice de refracción (IR)")
                                .frame(width: 200, height: 37)
                                .background(selectIR ?  colorboton :colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", indiceRef))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }.onTapGesture {
                            selectIR = true
                            selectMG = false; selectAL = false; selectK = false; selectCa = false; selectBa = false;
                            minValue = 1
                            maxValue = 2
                            
                        }
                        
                        HStack{
                            Text("Magnesio (Mg)")
                                .frame(width: 200, height: 37)
                                .background(selectMG ?  colorboton :colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", magnesio))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }.onTapGesture {
                            selectMG = true
                            selectIR = false; selectAL = false; selectK = false; selectCa = false; selectBa = false;
                            minValue = 0
                            maxValue = 5
                        }
                        
                        HStack{
                            Text("Aluminio (Al)")
                                .frame(width: 200, height: 37)
                                .background(selectAL ?  colorboton :colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", aluminio))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }.onTapGesture {
                            selectAL = true
                            selectIR = false; selectMG = false; selectK = false; selectCa = false; selectBa = false;
                            minValue = 0.1
                            maxValue = 3.6
                        }
                        
                        HStack{
                            Text("Potasio (K)")
                                .frame(width: 200, height: 37)
                                .background(selectK ?  colorboton :colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", potasio))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }.onTapGesture {
                            selectK = true
                            selectIR = false; selectMG = false; selectAL = false; selectCa = false; selectBa = false;
                            minValue = 0
                            maxValue = 6.5
                        }
                        
                        HStack{
                            Text("Calcio (Ca)")
                                .frame(width: 200, height: 37)
                                .background(selectCa ?  colorboton :colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", calcio))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }.onTapGesture {
                            selectCa = true
                            selectIR = false; selectMG = false; selectAL = false; selectK = false; selectBa = false;
                            minValue = 5.3
                            maxValue = 16.5
                        }
                        
                        HStack{
                            Text("Bario (Ba)")
                                .frame(width: 200, height: 37)
                                .background(selectBa ?  colorboton :colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", bario))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }.onTapGesture {
                            selectBa = true
                            selectIR = false; selectMG = false; selectAL = false; selectK = false; selectCa = false;
                            minValue = 0
                            maxValue = 3.5
                        }
                        
                        Button("Limpiar datos"){
                            indiceRef = 0
                            magnesio = 0
                            aluminio = 0
                            potasio = 0
                            calcio = 0
                            bario = 0
                        }.foregroundColor(rojotxt)
                        
                        HStack{
                            Spacer()
                            Text("\(String(format: "%.2f", minValue))")
                            Slider(value: selectIR ? $indiceRef : selectMG ? $magnesio : selectAL ? $aluminio : selectK ? $potasio : selectCa ? $calcio : selectBa ? $bario : $parametro, in: minValue...maxValue)
                            Text("\(String(format: "%.2f", maxValue))")
                            Spacer()
                        }.frame(width: 310, height: 50)
                            .background(colorcampostxt)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    Spacer()
                }.frame(width: 295)
                    .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
            )
        Spacer()
    }
}


struct RevisionDatosExp: View{
    @EnvironmentObject var vm: ViewModel
    @State var nombre: String = "NOMBRE"
    @State var descripcion: String = "DESCRIPCION"
    @State var fechaToma: Date = Date()
    
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
//                    Text("Repaso de la información")
//                        .foregroundColor(.white)
//                        .font(.custom("g" ,size: 26))
//                    Spacer()
                    
                    VStack{
                        HStack{
                            Text("Nombre del experimento")
                                .foregroundColor(.white)
                                .font(.headline)
                            Spacer()
                        }
                        Text("\(nombre)")
                            .frame(width: 295, height: 42)
                            .background(colorcampostxt)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundColor(.white)
                        
                        HStack{
                            Text("Fecha de toma")
                                .foregroundColor(.white)
                                .font(.headline)
                            Text("\(fechaToma.formatted())")
                                .frame(width: 170, height: 42)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                        HStack{
                            Text("Descripción")
                                .foregroundColor(.white)
                                .font(.headline)
                            Spacer()
                        }
                        Text("\(descripcion)")
                            .frame(width:295,height: 250)
                            .background(colorcampostxt)
                            .clipShape(RoundedRectangle(cornerRadius: 15))

                        
                        HStack{
                            Text("Indice Refracción (IR)")
                                .frame(width: 190, height: 37)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", calcio))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                        HStack{
                            Text("Magnesio (Mg)")
                                .frame(width: 190, height: 37)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", calcio))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                    }
                    VStack{
                        HStack{
                            Text("Aluminio (Al)")
                                .frame(width: 190, height: 37)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", calcio))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                        
                        HStack{
                            Text("Potasio (K)")
                                .frame(width: 190, height: 37)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", calcio))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                        
                        HStack{
                            Text("Calcio (Ca)")
                                .frame(width: 190, height: 37)
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
                                .frame(width: 190, height: 37)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("\(String(format: "%.2f", calcio))")
                                .frame(width: 99,  height: 34)
                                .background(colorcampostxt)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .foregroundColor(.white)
                        }
                    }
                }.frame(width: 295)
                    .foregroundColor(Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255))
            )
    }
}


struct NuevoExperimentoView_Previews: PreviewProvider {
    static var previews: some View {
        RevisionDatosExp()
    }
}
