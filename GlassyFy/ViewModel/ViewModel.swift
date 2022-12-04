//
//  SwiftUIView.swift
//  GlassyFy
//
//  Created by Aula11 on 11/11/22.
//

import Foundation
import CoreData
import UIKit

//class ViewModel: ObservableObject {
//    let gestorCoreData = CoreDataManager.instance //singleton (1 sola instancia)
//
//    @Published var usuarioArray: [UsuarioEntity] = []
//    @Published var experimentoArray: [ExperimentoEntity] = []
//
//    init(){
//        cargarDatos()
//
//    }
//
//    func cargarDatos(){
//        usuarioArray.removeAll()
//        experimentoArray.removeAll()
//        let fetchUsuarios = NSFetchRequest<UsuarioEntity>(entityName: "UsuarioEntity")
//        let fetchExperimentos = NSFetchRequest<ExperimentoEntity>(entityName: "ExperimentoEntity")
//        do{
//            self.usuarioArray = try gestorCoreData.contexto.fetch(fetchUsuarios).sorted(){$0.nombre! < $1.nombre!}
//            self.experimentoArray = try gestorCoreData.contexto.fetch(fetchExperimentos).sorted(){$0.nombre! < $1.nombre!}
//        }catch let error{
//            print("Error al cargar los datos: \(error)")
//        }
//    }
//
//    func guardarDatos(){   //no eficiente, pero hay pocos datos
//        gestorCoreData.save()
//        cargarDatos()
//    }
//
//    func addPersona(nombre: String, foto: UIImage){
//        let nuevaPersona = UsuarioEntity(context: gestorCoreData.contexto)
//        nuevaPersona.nombre = nombre
//        nuevaPersona.foto = foto.pngData()
//        guardarDatos()
//    }
//
//    func deletePersona(indexSet: IndexSet){
//        for index in indexSet{  //podrÌa eliminar varios a lavez
//            gestorCoreData.contexto.delete(usuarioArray[index])
//        }
//        guardarDatos()
//    }
//
//    func addMascota(usuario: UsuarioEntity, nombre: String, aluminio: Decimal, bario: Decimal,calcio:Decimal, fecha:Date,iR:Decimal,magnesio:Decimal,potasio:Decimal,tipo:String ){
//        let nuevoExperimento = ExperimentoEntity(context: gestorCoreData.contexto)
//        nuevoExperimento.nombre = nombre
//       // nuevoExperimento.aluminio = aluminio
//       // nuevoExperimento.bario = bario
//        //nuevoExperimento.calcio = calcio
//        nuevoExperimento.fecha = fecha
//       // nuevoExperimento.iR = iR
//        //nuevoExperimento.magnesio = magnesio
//        //nuevoExperimento.potasio = potasio
//        nuevoExperimento.tipo = tipo
//
//
//
//        guardarDatos()
//    }
//
//    func deleteMascota(mascota: ExperimentoEntity){
//        gestorCoreData.contexto.delete(mascota)
//        guardarDatos()
//    }
//}

