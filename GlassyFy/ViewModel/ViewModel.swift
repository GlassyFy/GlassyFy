//
//  SwiftUIView.swift
//  GlassyFy
//
//  Created by Aula11 on 11/11/22.
//

import Foundation
import CoreData
import UIKit

class ViewModel: ObservableObject {
    let gestorCoreData = CoreDataManager.instance //singleton (1 sola instancia)

    @Published var experimentoArray: [ExperimentoEntity] = []
    @Published var usuarioArray: [UsuarioEntity] = []
    
    init(){
        cargarDatos()
    }
    
    func cargarDatos(){
        experimentoArray.removeAll()
        usuarioArray.removeAll()
        let fetchUsuarios = NSFetchRequest<UsuarioEntity>(entityName: "UsuarioEntity")
        let fetchExperimentos = NSFetchRequest<ExperimentoEntity>(entityName: "ExperimentoEntity")
        do{
            self.usuarioArray = try gestorCoreData.contexto.fetch(fetchUsuarios).sorted(){$0.nombre! < $1.nombre!}
            self.experimentoArray = try gestorCoreData.contexto.fetch(fetchExperimentos).sorted(){$0.nombre! < $1.nombre!}
        }catch let error{
            print("Error al cargar los datos: \(error)")
        }
    }
    
    func guardarDatos(){   //no eficiente, pero hay pocos datos
        gestorCoreData.save()
        cargarDatos()
    }
  
    func addExperimento(usuario: UsuarioEntity, nombre: String, fechaToma: Date, descripcion: String, inRef: Double, magnesio: Double, aluminio: Double, potasio: Double, Calcio: Double, Bario: Double){
        let nuevoExperimento = ExperimentoEntity(context: gestorCoreData.contexto)
        nuevoExperimento.nombre = nombre
        nuevoExperimento.usuariosRelation = usuario
        nuevoExperimento.fechaToma = fechaToma
        nuevoExperimento.descripcion = descripcion
        nuevoExperimento.iR = inRef
        nuevoExperimento.magnesio = magnesio
        nuevoExperimento.aluminio = aluminio
        nuevoExperimento.potasio = potasio
        nuevoExperimento.calcio = Calcio
        nuevoExperimento.bario = Bario
        nuevoExperimento.fechaCreacion = Date()
        guardarDatos()
    }

    func deleteMascota(experimento: ExperimentoEntity){
        gestorCoreData.contexto.delete(experimento)
        guardarDatos()
    }
}

