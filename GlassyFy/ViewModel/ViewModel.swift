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
  
//    func addMascota(persona: PersonaEntity, nombre: String, edad: Int16, raza: String){
//        let nuevaMascota = MascotaEntity(context: gestorCoreData.contexto)
//        nuevaMascota.nombre = nombre
//        nuevaMascota.edad = edad
//        nuevaMascota.raza = raza
//        nuevaMascota.personasRelation = persona   // atributo de relaciÛn
//        guardarDatos()
//    }
//
//    func deleteMascota(mascota: MascotaEntity){
//        gestorCoreData.contexto.delete(mascota)
//        guardarDatos()
//    }
}

