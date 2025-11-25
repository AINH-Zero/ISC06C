package Exam;
//ANGEL ISSAC NUÑEZ HERNANDEZ UP230534
// MARCO ANTONIO DE JESUS VAZQUEZ NORIEGA UP230432

public abstract class Estudiante {
    String nombre;
    int matricula;
    double[] calificaciones = new double[5];
    final double puntajeMaximo = 100.0;

    public Estudiante(String nombre, int matricula, double[] calificaciones) {
        this.nombre = nombre;
        this.matricula = matricula;
        this.calificaciones = calificaciones;
    }

    public double[] getCalificaciones() {
        return calificaciones;
    }

    public int getMatricula() {
        return matricula;
    }

    public String getNombre() {
        return nombre;
    }

    public double getPuntajeMaximo() {
        return puntajeMaximo;
    }

    public void setCalificaciones(double[] calificaciones) {
        this.calificaciones = calificaciones;
    }

    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public abstract double calcularPromedio();
    public String mostrarDatos(){
        return "Nombre: " + getNombre() + ", Matricula: " + getMatricula() + ", Promedio: " + calcularPromedio();
    }
}
