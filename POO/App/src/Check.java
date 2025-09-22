public class Check {
    public static void main(String[] args) {
        int numero = 5;

        for (int i = 1; i <= 10; i++) {
            int resultado = numero * i;
            System.out.println(numero + " x " + i + " = " + resultado);
        }

        //Sumar multiplos de 3 entre 1 y 20
        int suma = 0;
        for(int i = 1; i<= 20; i++) {
            if(i%3==0) {
                suma = suma + i;
            }
        }
        System.out.println("Suma de los multiplos: " + suma);

        //Serie fibonacci con bug, deberia imprimir los primeros 10 numeros
        int a = 0, b = 1;
        for (int i = 1; i <= 10; i++) {
            System.out.println("Numero" + i + ": " + a);
            a = b;
            b = a + b;
        }

        //Cacular el promedio de 5 calificaciones, 
        int[] calificaciones = { 80, 90, 70, 60, 100};
        int sumaPromedio = 0;

        for ( int i = 0; i < calificaciones.length; i++) {
            sumaPromedio += calificaciones[i];
        }

        double promedio = sumaPromedio / calificaciones.length;
        System.out.println("Promedio: " + promedio);


        //Buscar un numero dengtro de un arreglo
        int[] numeros = { 3, 8, 15, 20, 7};
        int buscador = 15;
        boolean bandera = false;

        for (int i = 0; i < numeros.length; i++) {
            if ( numeros[i] == buscador) {
                bandera = true;
                break;
            }
        }

        if( bandera == true) {
            System.out.println(("numero encontrado"));
        } else {
            System.out.println("numero no encontrado");
        }

    }
}
