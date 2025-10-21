package Estudiante;

public class Estudiante {
    private String nombre;
    private float promedio;
    private int edad;

    // Constructor
    public void Estudiate(String nombre, float promedio, int edad) {
        this.nombre = nombre;
        this.promedio = promedio;
        this.edad = edad;
    }

    // Getters y Setters
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public float getPromedio() {
        return promedio;
    }

    public void setPromedio(float promedio) {
        this.promedio = promedio;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    // Metodos
    public String mostrarInfo(){
        return "Nombre: " + getNombre() + ", Promedio: " + getPromedio() + ", Edad: " + getEdad();
    }
}
