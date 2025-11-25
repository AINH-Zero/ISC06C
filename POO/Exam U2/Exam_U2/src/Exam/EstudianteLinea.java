package Exam;
//ANGEL ISSAC NUÑEZ HERNANDEZ UP230534
// MARCO ANTONIO DE JESUS VAZQUEZ NORIEGA UP230432

public class EstudianteLinea extends Estudiante {
    int proyectosEntregados;

    public EstudianteLinea(String nombre, int matricula, double[] calificaciones, int proyectosEntregados) {
        super(nombre, matricula, calificaciones);
        this.proyectosEntregados = proyectosEntregados;
    }

    public int getProyectosEntregados() {
        return proyectosEntregados;
    }

    public void setProyectosEntregados(int proyectosEntregados) {
        this.proyectosEntregados = proyectosEntregados;
    }

    @Override
    public double calcularPromedio() {
        //(Suma calificaciones/5) + (Proyectos * 0.2)
        double sumaCalif = 0;
        for (double calif : getCalificaciones()) {
            sumaCalif += calif;
        }
        return (sumaCalif / 5) + (getProyectosEntregados() * 0.2);
    }
}
