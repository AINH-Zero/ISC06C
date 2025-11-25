package Exam;
//ANGEL ISSAC NUÑEZ HERNANDEZ UP230534
// MARCO ANTONIO DE JESUS VAZQUEZ NORIEGA UP230432

public class EstudiantePresencial extends Estudiante {
    int asistencia;

    public EstudiantePresencial(String nombre, int matricula, double[] calificaciones, int asistencia) {
        super(nombre, matricula, calificaciones);
        this.asistencia = asistencia;
    }

    public int getAsistencia() {
        return asistencia;
    }

    public void setAsistencia(int asistencia) {
        this.asistencia = asistencia;
    }

    @Override
    public double calcularPromedio() {
        //(Suma calificaciones/5) + (asistencia * 0.1)
        double sumaCalif = 0;
        for (double calif : getCalificaciones()) {
            sumaCalif += calif;
        }
        return (sumaCalif / 5) + (getAsistencia() * 0.1);
    }
}
