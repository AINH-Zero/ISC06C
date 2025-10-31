public class Persona {
    private String nombre;
    private int edad;

    public Persona(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    // PropertyValueFactory usa estos métodos "get" para obtener los datos
    public String getNombre() {
        return nombre;
    }

    public int getEdad() {
        return edad;
    }
}