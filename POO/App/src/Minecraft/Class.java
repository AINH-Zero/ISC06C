package Minecraft;
import java.util.Scanner;

public class Class {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        /*
        System.out.println("Hello, World!");
        //Objeto creamos una instancia de la clase jugador
        Jugador steve = new Jugador("Steve");
        //OBJETO creamos una instancia de la clase Pico(Hereda de herramienta)
        Pico picoHierro = new Pico("Hierro", "Pico", 5);
        Hacha hachaDiamante = new Hacha("Diamante", "Hacha",20);
        Espada espadaHierro = new Espada("Acero", "Espada",7);
        Arco arcoMadera = new Arco("Madera", "Arco",4);

        //Asociacion: el jugador "tiene una" herramienta (relacion entre clases)
        steve.equiparHerramienta(picoHierro);
        //llamar a metodos 
        steve.minar("piedra");
        steve.equiparHerramienta(hachaDiamante);
        steve.equiparHerramienta(arcoMadera);
        steve.equiparHerramienta(espadaHierro);
        */
        Jugador jugador = null; // Declarar fuera del bucle para que persista
        Boolean Menu = true;
        while (Menu) {
            System.out.println("Bienvenido a Mainkra");
            System.out.println("Seleccione una opcion: \n1. Crear Jugador \n2. Añadir Item al Inventario \n3. Mostrar Inventario \n4. Buscar Item \n5. Elmininar Item \n6. Salir");
            Integer seleccion = sc.nextInt();
            switch (seleccion) {
                case 1:
                    System.out.print("Ingrese el nombre del jugador: ");
                    String nombreJugador = sc.next(); // Lee el nombre
                    jugador = new Jugador(nombreJugador); // Crea el jugador
                    System.out.println("Jugador '" + jugador.getNombre() + "' creado exitosamente con un inventario vacío.");
                    break;
                case 2:
                    if (jugador == null) {
                        System.out.println("Primero debes crear un jugador (opción 1).");
                    } else {
                        System.out.print("Ingrese el nombre del item: ");
                        String nombreItem = sc.next();
                        System.out.print("Ingrese el tipo del item: ");
                        String tipoItem = sc.next();
                        System.out.print("Ingrese la cantidad del item: ");
                        int cantidadItem = sc.nextInt();
                        System.out.print("Ingrese la posición en el inventario (0-35): ");
                        int posicion = sc.nextInt();
                        Item nuevoItem = new Item(nombreItem, tipoItem, cantidadItem);
                        jugador.getInventario().agregarItem(nuevoItem, posicion);
                        System.out.println("Item agregado exitosamente al inventario.");
                    }
                    break;
                case 3:
                    if (jugador != null) {
                        jugador.getInventario().mostrarItems();
                    } else {
                        System.out.println("Primero debes crear un jugador (opción 1).");
                    }
                    break;
                case 4:
                    if (jugador != null) {
                        System.out.print("Ingrese el nombre del item a buscar: ");
                        String nombreBuscar = sc.next();
                        jugador.getInventario().buscarItem(nombreBuscar);
                    } else {
                        System.out.println("Primero debes crear un jugador (opción 1).");
                    }
                    break;
                case 5:
                    if (jugador != null) {
                        System.out.print("Ingrese la posición del item a eliminar (0-35): ");
                        int posicionEliminar = sc.nextInt();
                        jugador.getInventario().eliminarItem(posicionEliminar);
                    } else {
                        System.out.println("Primero debes crear un jugador (opción 1).");
                    }
                case 6:
                    System.out.println("Saliendo del juego...");
                    Menu = false;
                    break;
                default:
                    System.out.println("Opción no válida. Por favor, intente de nuevo.");
                    break;
        }
        }
        sc.close();
    }
}