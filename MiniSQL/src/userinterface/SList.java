/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userinterface;

import java.util.ArrayList;

/**
 *
 * @author jmoll
 */
public class SList extends ArrayList<Simbolo> {
    public SList(){
        super();
        //BDD master
        Simbolo simb = new Simbolo("master");
        simb.setAtributos("tipo=bdd");
        this.add(simb);

        //ESQUEMA dbo
        simb = new Simbolo("dbo");
        simb.setAtributos("tipo=esquema","base=master");
        this.add(simb);

        //BDD Motociclismo
        simb = new Simbolo("Motociclismo");
        simb.setAtributos("tipo=bdd");
        this.add(simb);

        //ESQUEMA dbo
        simb = new Simbolo("dbo");
        simb.setAtributos("tipo=esquema","base=Motociclismo");
        this.add(simb);

        //ESQUEMA NASCAR
        simb = new Simbolo("NASCAR");
        simb.setAtributos("tipo=esquema","base=Motociclismo");
        this.add(simb);

        //TABLA Carrera
        simb = new Simbolo("Carrera");
        simb.setAtributos("tipo=tabla","base=Motociclismo","esquema=NASCAR");
        this.add(simb);

        simb = new Simbolo("NombreGP");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Carrera","tipoDato=VARCHAR","largoMax=15","nulable=False");
        this.add(simb);
        
        simb = new Simbolo("Año");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Carrera","tipoDato=VARCHAR","largoMax=4","nulable=False");
        this.add(simb);
        
        simb = new Simbolo("FechaHoraInicio");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Carrera","tipoDato=VARCHAR","largoMax=25","nulable=False");
        this.add(simb);
        
        simb = new Simbolo("NumVueltas");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Carrera","tipoDato=INT","nulable=False");
        this.add(simb);
        
        simb = new Simbolo("NombreCircuito");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Carrera","tipoDato=VARCHAR","largoMax=15","nulable=False");
        this.add(simb);

        //TABLA Circuito
        simb = new Simbolo("Circuito");
        simb.setAtributos("tipo=tabla","base=Motociclismo","esquema=NASCAR");
        this.add(simb);

        simb = new Simbolo("Nombre");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Circuito","tipoDato=VARCHAR","largoMax=15","nulable=False");
        this.add(simb);

        simb = new Simbolo("Pais");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Circuito","tipoDato=VARCHAR","largoMax=15","nulable=False");
        this.add(simb);

        simb = new Simbolo("Tipo");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Circuito","tipoDato=VARCHAR","largoMax=15","nulable=False");
        this.add(simb);

        simb = new Simbolo("Longitud");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Circuito","tipoDato=FLOAT","largoMax=4","decimal=1","nulable=False");
        this.add(simb);

        simb = new Simbolo("Diseñador");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Circuito","tipoDato=VARCHAR","largoMax=20","nulable=False");
        this.add(simb);

        //TABLA CONSULTAS_SQL
        simb = new Simbolo("CONSULTAS_SQL");
        simb.setAtributos("tipo=tabla","base=Motociclismo","esquema=dbo");
        this.add(simb);

        simb = new Simbolo("ID_CONSULTA");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=dbo","tabla=CONSULTAS_SQL","tipoDato=INT","nulable=False");
        this.add(simb);

        simb = new Simbolo("CONSULTA");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=dbo","tabla=CONSULTAS_SQL","tipoDato=VARCHAR","largoMax=800","nulable=False");
        this.add(simb);

        //TABLA Escuderia
        simb = new Simbolo("Escuderia");
        simb.setAtributos("tipo=tabla","base=Motociclismo","esquema=NASCAR");
        this.add(simb);

        simb = new Simbolo("Nombre");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Escuderia","tipoDato=VARCHAR","largoMax=20","nulable=False");
        this.add(simb);

        simb = new Simbolo("Manager");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Escuderia","tipoDato=VARCHAR","largoMax=15","nulable=False");
        this.add(simb);

        simb = new Simbolo("FabricanteMotor");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Escuderia","tipoDato=VARCHAR","largoMax=15","nulable=False");
        this.add(simb);

        simb = new Simbolo("Sede");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Escuderia","tipoDato=VARCHAR","largoMax=15","nulable=False");
        this.add(simb);

        //TABLA Piloto
        simb = new Simbolo("Piloto");
        simb.setAtributos("tipo=tabla","base=Motociclismo","esquema=NASCAR");
        this.add(simb);

        simb = new Simbolo("Codigo");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Piloto","tipoDato=INT","nulable=False","identidad=True","inicial=1","salto=1");
        this.add(simb);

        simb = new Simbolo("Nombre");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Piloto","tipoDato=VARCHAR","largoMax=50","nulable=False");
        this.add(simb);

        simb = new Simbolo("Nacionalidad");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Piloto","tipoDato=VARCHAR","largoMax=15","nulable=False");
        this.add(simb);

        simb = new Simbolo("FechaNacimiento");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Piloto","tipoDato=VARCHAR","largoMax=25","nulable=False");
        this.add(simb);

        simb = new Simbolo("CarreraDebut");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Piloto","tipoDato=VARCHAR","largoMax=20","nulable=False");
        this.add(simb);
        
        simb = new Simbolo("NombreEscuderia");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Piloto","tipoDato=VARCHAR","largoMax=20","nulable=False");
        this.add(simb);

        //TABLA Resultado
        simb = new Simbolo("Resultado");
        simb.setAtributos("tipo=tabla","base=Motociclismo","esquema=NASCAR");
        this.add(simb);

        simb = new Simbolo("NombreGP");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Resultado","tipoDato=VARCHAR","largoMax=15","nulable=False");
        this.add(simb);

        simb = new Simbolo("Año");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Resultado","tipoDato=VARCHAR","largoMax=4","nulable=False");
        this.add(simb);

        simb = new Simbolo("CodPiloto");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Resultado","tipoDato=INT","nulable=False");
        this.add(simb);

        simb = new Simbolo("Puesto");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Resultado","tipoDato=INT","nulable=False");
        this.add(simb);

        simb = new Simbolo("DistanciaGanador");
        simb.setAtributos("tipo=campo","base=Motociclismo","esquema=NASCAR","tabla=Resultado","tipoDato=VARCHAR","largoMax=25","nulable=False");
        this.add(simb);

        //Veterinaria

        //BDD Veterinaria
        simb = new Simbolo("Veterinaria");
        simb.setAtributos("tipo=bdd");
        this.add(simb);

        //ESQUEMA dbo
        simb = new Simbolo("dbo");
        simb.setAtributos("tipo=esquema","base=Veterinaria");
        this.add(simb);

        //TABLA Calendario Vacunacion
        simb = new Simbolo("CalendarioVacunacion");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);

        simb = new Simbolo("Fecha");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=CalendarioVacunacion","tipoDato=VARCHAR","largoMax=8","nulable=False");
        this.add(simb);

        simb = new Simbolo("Enfermedad");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=CalendarioVacunacion","tipoDato=VARCHAR","largoMax=50","nulable=False");
        this.add(simb);

        simb = new Simbolo("CodigoPaciente");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=CalendarioVacunacion","tipoDato=VARCHAR","largoMax=8","nulable=False");
        this.add(simb);

        //TABLA Cliente
        simb = new Simbolo("Cliente");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);

        simb = new Simbolo("DPI");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Cliente","tipoDato=VARCHAR","largoMax=13","nulable=False");
        this.add(simb);

        simb = new Simbolo("NIT");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Cliente","tipoDato=VARCHAR","largoMax=12","nulable=False");
        this.add(simb);

        simb = new Simbolo("Nombre");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Cliente","tipoDato=VARCHAR","largoMax=50","nulable=False");
        this.add(simb);

        simb = new Simbolo("Numero");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Cliente","tipoDato=VARCHAR","largoMax=8","nulable=False");
        this.add(simb);

        simb = new Simbolo("Direccion");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Cliente","tipoDato=VARCHAR","largoMax=800","nulable=True");
        this.add(simb);

        simb = new Simbolo("Correo");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Cliente","tipoDato=VARCHAR","largoMax=800","nulable=True");
        this.add(simb);

        //TABLA Clinica
        simb = new Simbolo("Clinica");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);

        simb = new Simbolo("Codigo");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Clinica","tipoDato=INT","nulable=False","identidad=True","inicial=1","salto=1");
        this.add(simb);

        simb = new Simbolo("Nombre");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Clinica","tipoDato=VARCHAR","largoMax=50","nulable=False");
        this.add(simb);

        simb = new Simbolo("Direccion");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Clinica","tipoDato=VARCHAR","largoMax=800","nulable=False");
        this.add(simb);

        //TABLA Consulta
        simb = new Simbolo("Consulta");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);

        simb = new Simbolo("Sala");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Consulta","tipoDato=VARCHAR","largoMax=20","nulable=False");
        this.add(simb);

        simb = new Simbolo("PrecioFijo");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Consulta","tipoDato=FLOAT","largoMax=4","decimal=2","nulable=False");
        this.add(simb);

        simb = new Simbolo("NumerosOperaciones");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Consulta","tipoDato=INT","nulable=True");
        this.add(simb);

        simb = new Simbolo("NumerosVacunas");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Consulta","tipoDato=INT","nulable=True");
        this.add(simb);

        simb = new Simbolo("NumerosPruebasEspecificas");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Consulta","tipoDato=INT","nulable=True");
        this.add(simb);

        simb = new Simbolo("PrecioOperaciones");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Consulta","tipoDato=FLOAT","largoMax=4","decimal=2","nulable=True");
        this.add(simb);

        simb = new Simbolo("PrecioVacunas");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Consulta","tipoDato=FLOAT","largoMax=4","decimal=2","nulable=True");
        this.add(simb);

        simb = new Simbolo("PrecioPruebasEspecificas");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Consulta","tipoDato=FLOAT","largoMax=4","decimal=2","nulable=True");
        this.add(simb);

        simb = new Simbolo("CodigoPaciente");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Consulta","tipoDato=VARCHAR","largoMax=8","nulable=False");
        this.add(simb);

        simb = new Simbolo("NombreVeterinario");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Consulta","tipoDato=VARCHAR","largoMax=50","nulable=True");
        this.add(simb);

        simb = new Simbolo("FECHA");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Consulta","tipoDato=VARCHAR","largoMax=8","nulable=True");
        this.add(simb);

        //TABLA Diagnostico
        simb = new Simbolo("Diagnostico");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);

        simb = new Simbolo("Resultado");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Diagnostico","tipoDato=VARCHAR","largoMax=20","nulable=False");
        this.add(simb);

        simb = new Simbolo("PruebaEspecifica");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Diagnostico","tipoDato=VARCHAR","largoMax=20","nulable=True");
        this.add(simb);

        simb = new Simbolo("Lugar");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Diagnostico","tipoDato=VARCHAR","largoMax=15","nulable=True");
        this.add(simb);

        simb = new Simbolo("FechaPrueba");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Diagnostico","tipoDato=VARCHAR","largoMax=800","nulable=True");
        this.add(simb);        

        simb = new Simbolo("CodigoPaciente");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Diagnostico","tipoDato=VARCHAR","largoMax=8","nulable=True");
        this.add(simb);

        //TABLA Factura
        simb = new Simbolo("Factura");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);

        simb = new Simbolo("Numero");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Factura","tipoDato=VARCHAR","largoMax=10","nulable=False");
        this.add(simb);

        simb = new Simbolo("Detalle");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Factura","tipoDato=VARCHAR","largoMax=50","nulable=False");
        this.add(simb);

        simb = new Simbolo("Importe");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Factura","tipoDato=FLOAT","largoMax=4","decimal=2","nulable=False");
        this.add(simb);

        simb = new Simbolo("TOTAL");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Factura","tipoDato=FLOAT","largoMax=4","decimal=2","nulable=False");
        this.add(simb);

        simb = new Simbolo("CodigoClinica");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Factura","tipoDato=INT","nulable=True");
        this.add(simb);

        simb = new Simbolo("NITCliente");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Factura","tipoDato=VARCHAR","largoMax=12","nulable=False");
        this.add(simb);

        //TABLA Historial Medico
        simb = new Simbolo("HistorialMedico");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);

        simb = new Simbolo("MotivoVisita");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=HistorialMedico","tipoDato=VARCHAR","largoMax=20","nulable=False");
        this.add(simb);

        simb = new Simbolo("FechaVisita");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=HistorialMedico","tipoDato=VARCHAR","largoMax=800","nulable=False");
        this.add(simb);

        simb = new Simbolo("CodigoPaciente");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=HistorialMedico","tipoDato=VARCHAR","largoMax=8","nulable=False");
        this.add(simb);

        simb = new Simbolo("ResultadoDiagnostico");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=HistorialMedico","tipoDato=VARCHAR","largoMax=20","nulable=False");
        this.add(simb);

        //TABLA Laboratorio
        simb = new Simbolo("Laboratorio");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);

        simb = new Simbolo("NIT");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Laboratorio","tipoDato=VARCHAR","largoMax=12","nulable=False");
        this.add(simb);

        simb = new Simbolo("Nombre");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Laboratorio","tipoDato=VARCHAR","largoMax=50","nulable=False");
        this.add(simb);

        simb = new Simbolo("Direccion");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Laboratorio","tipoDato=VARCHAR","largoMax=800","nulable=False");
        this.add(simb);

        //TABLA Medicina
        simb = new Simbolo("Medicina");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);

        simb = new Simbolo("Codigo");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Medicina","tipoDato=INT","nulable=False","identidad=True","inicio=1","salto=1");
        this.add(simb);

        simb = new Simbolo("Nombre");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Medicina","tipoDato=VARCHAR","largoMax=50","nulable=False");
        this.add(simb);

        simb = new Simbolo("PrecioUnitario");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Medicina","tipoDato=NUMERIC","largoMax=10","decimal=2","nulable=False");
        this.add(simb);

        //TABLA
        simb = new Simbolo("OperacionQuirurgica");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);

        simb = new Simbolo("CodigoClinica");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=OperacionQuirurgica","tipoDato=INT","nulable=True");
        this.add(simb);

        simb = new Simbolo("Quirofano");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=OperacionQuirurgica","tipoDato=VARCHAR","largoMax=15","nulable=False");
        this.add(simb);

        simb = new Simbolo("NombreVeterinario");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=OperacionQuirurgica","tipoDato=VARCHAR","largoMax=50","nulable=True");
        this.add(simb);

        simb = new Simbolo("Fecha");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=OperacionQuirurgica","tipoDato=VARCHAR","largoMax=800","nulable=True");
        this.add(simb);

        simb = new Simbolo("Duracion");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=OperacionQuirurgica","tipoDato=VARCHAR","largoMax=20","nulable=False");
        this.add(simb);

        simb = new Simbolo("Observaciones");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=OperacionQuirurgica","tipoDato=VARCHAR","largoMax=800","nulable=True");
        this.add(simb);

        //TABLA
        simb = new Simbolo("Paciente");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);

        simb = new Simbolo("Codigo");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Paciente","tipoDato=VARCHAR","largoMax=8","nulable=False");
        this.add(simb);

        simb = new Simbolo("Nombre");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Paciente","tipoDato=VARCHAR","largoMax=800","nulable=True");
        this.add(simb);

        simb = new Simbolo("Especie");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Paciente","tipoDato=VARCHAR","largoMax=800","nulable=True");
        this.add(simb);

        simb = new Simbolo("Raza");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Paciente","tipoDato=VARCHAR","largoMax=800","nulable=True");
        this.add(simb);

        simb = new Simbolo("ColorPelo");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Paciente","tipoDato=VARCHAR","largoMax=800","nulable=True");
        this.add(simb);

        simb = new Simbolo("FechaNacimiento");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Paciente","tipoDato=VARCHAR","largoMax=800","nulable=True");
        this.add(simb);

        simb = new Simbolo("PesoMedio");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Paciente","tipoDato=VARCHAR","largoMax=800","nulable=True");
        this.add(simb);

        simb = new Simbolo("CodigoClinica");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Paciente","tipoDato=INT","nulable=True");
        this.add(simb);

        simb = new Simbolo("NITCliente");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Paciente","tipoDato=VARCHAR","largoMax=12","nulable=True");
        this.add(simb);

        //TABLA Producto
        simb = new Simbolo("Producto");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);

        simb = new Simbolo("Codigo");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Producto","tipoDato=INT","identidad=True","inicio=1","salto=1","nulable=False");
        this.add(simb);

        simb = new Simbolo("Nombre");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Producto","tipoDato=VARCHAR","largoMax=50","nulable=False");
        this.add(simb);

        simb = new Simbolo("PrecioUnitario");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Producto","tipoDato=NUMERIC","largoMax=10","decimal=2","nulable=False");
        this.add(simb);

        simb = new Simbolo("Proveedor");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);

        simb = new Simbolo("NIT");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Proveedor","tipoDato=VARCHAR","largoMax=12","nulable=False");
        this.add(simb);

        simb = new Simbolo("Nombre");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Proveedor","tipoDato=VARCHAR","largoMax=50","nulable=False");
        this.add(simb);
        
        simb = new Simbolo("Direccion");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Proveedor","tipoDato=VARCHAR","largoMax=800","nulable=False");
        this.add(simb);
        
        simb = new Simbolo("SuministraFarmacia");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);
        
        simb = new Simbolo("NITLaboratorio");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=SuministraFarmacia","tipoDato=VARCHAR","largoMax=12","nulable=False");
        this.add(simb);

        simb = new Simbolo("CodigoMedicina");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=SuministraFarmacia","tipoDato=INT","nulable=False");
        this.add(simb);

        simb = new Simbolo("SuministraTienda");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);
        
        simb = new Simbolo("NITProveedor");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=SuministraTienda","tipoDato=VARCHAR","largoMax=12","nulable=False");
        this.add(simb);        
        
        simb = new Simbolo("CodigoProducto");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=SuministraTienda","tipoDato=INT","nulable=False");
        this.add(simb);

        simb = new Simbolo("Tratamiento");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo"); 
        this.add(simb);

        simb = new Simbolo("Medicamento");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Tratamiento","tipoDato=VARCHAR","largoMax=20","nulable=False");
        this.add(simb);
        
        simb = new Simbolo("Dosificacion");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Tratamiento","tipoDato=VARCHAR","largoMax=800","nulable=False");
        this.add(simb);

        simb = new Simbolo("Duracion");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Tratamiento","tipoDato=VARCHAR","largoMax=20","nulable=False");
        this.add(simb);

        simb = new Simbolo("Resultado");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Tratamiento","tipoDato=VARCHAR","largoMax=20","nulable=False");
        this.add(simb);

        simb = new Simbolo("CodigoPaciente");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Tratamiento","tipoDato=VARCHAR","largoMax=8","nulable=False");
        this.add(simb);

        simb = new Simbolo("VentaFarmacia");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);
        
        simb = new Simbolo("NITCliente");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=VentaFarmacia","tipoDato=VARCHAR","largoMax=12","nulable=False");
        this.add(simb);
        
        simb = new Simbolo("CodigoMedicina");
        simb.setAtributos("tipo=campo","base=Vetarinaria","esquema=dbo","tabla=VentaFarmacia","tipoDato=INT","nulable=False");
        this.add(simb);
        
        simb = new Simbolo("Fecha");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=VentaFarmacia","tipoDato=VARCHAR","largoMax=800","nulable=False");
        this.add(simb);
        
        simb = new Simbolo("CodigoClinica");
        simb.setAtributos("tipo=campo","base=Vetarinaria","esquema=dbo","tabla=VentaFarmacia","tipoDato=INT","nulable=False");
        this.add(simb);

        simb = new Simbolo("VentaTienda");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);
        
        simb = new Simbolo("NITCliente");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=VentaTienda","tipoDato=VARCHAR","largoMax=12","nulable=False");
        this.add(simb);

        simb = new Simbolo("CodigoProducto");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=VentaTienda","tipoDato=INT","nulable=False");
        this.add(simb);
        
        simb = new Simbolo("Fecha");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=VentaTienda","tipoDato=VARCHAR","largoMax=800","nulable=False");
        this.add(simb);

        simb = new Simbolo("CodigoClinica");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=VentaTienda","tipoDato=INT","nulable=False");
        this.add(simb);

        simb = new Simbolo("Veterinario");
        simb.setAtributos("tipo=tabla","base=Veterinaria","esquema=dbo");
        this.add(simb);

        simb = new Simbolo("Nombre");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Venterinario","tipoDato=VARCHAR","largoMax=50","nulable=False");
        this.add(simb);

        simb = new Simbolo("SalarioBase");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Venterinario","tipoDato=FLOAT","largoMax=4","decimal=2","nulable=False");
        this.add(simb);

        simb = new Simbolo("Salario");
        simb.setAtributos("tipo=campo","base=Veterinaria","esquema=dbo","tabla=Ventario","tipoDato=FLOAT","largoMax=4","decimal=2","nulable=False");
        this.add(simb);
    }
}
