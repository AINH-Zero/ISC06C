package Exam;
//ANGEL ISSAC NUÑEZ HERNANDEZ UP230534
// MARCO ANTONIO DE JESUS VAZQUEZ NORIEGA UP230432

public class Main {
    public static void main(String[] args) {
        Grupo grupo = new Grupo();
        EstudiantePresencial estPresencial = new EstudiantePresencial("Ana Lopez", 1001, new double[]{92.4,92.4,92.4,92.4,92.4}, 1);
        EstudiantePresencial estPresecial2 = new EstudiantePresencial("Luis Torres", 1002, new double[]{87.3,87.3,87.3,87.3,87.3}, 1);
        EstudianteLinea estLinea = new EstudianteLinea("Marta Ruiz", 2001, new double[]{91.6,91.6,91.6,91.6,91.6}, 1);
        EstudianteLinea estLinea2 = new EstudianteLinea("Carlos Diaz", 2002, new double[]{87.8,87.8,87.8,87.8,87.8}, 1);
        grupo.agregarEstudiante(estPresencial);
        grupo.agregarEstudiante(estPresecial2);
        grupo.agregarEstudiante(estLinea);
        grupo.agregarEstudiante(estLinea2);
        grupo.mostrarGrupo();
    }
}
