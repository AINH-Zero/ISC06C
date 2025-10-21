package Estudiante;

public class Main {
    public static void main(String[] args) {
        Estudiante estudiante1 = new Estudiante();
        estudiante1.setNombre("Bruce Wayne");
        estudiante1.setPromedio(9.5f);
        estudiante1.setEdad(40);

        Estudiante estudiante2 = new Estudiante();
        estudiante2.setNombre("Dick Grayson");
        estudiante2.setPromedio(9.8f);
        estudiante2.setEdad(27);

        Estudiante estudiante3 = new Estudiante();
        estudiante3.setNombre("Jason Todd");
        estudiante3.setPromedio(9.2f);
        estudiante3.setEdad(30);

        System.out.println(estudiante1.mostrarInfo());
        System.out.println(estudiante2.mostrarInfo());
        System.out.println(estudiante3.mostrarInfo());

        estudiante3.setPromedio(9.5f);
        System.out.println(estudiante3.mostrarInfo());

    }
}
