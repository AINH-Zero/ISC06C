package Exam;
import java.util.ArrayList;
//ANGEL ISSAC NUÑEZ HERNANDEZ UP230534
// MARCO ANTONIO DE JESUS VAZQUEZ NORIEGA UP230432

public class Grupo {
    ArrayList <Estudiante> listaEstudiantes = new ArrayList<Estudiante>();

    public void agregarEstudiante(Estudiante estudiante) {
        listaEstudiantes.add(estudiante);
    }

    public void mostrarGrupo() {
        for (Estudiante estudiante : listaEstudiantes) {
            System.out.println(estudiante.mostrarDatos());
        }
    }
}
