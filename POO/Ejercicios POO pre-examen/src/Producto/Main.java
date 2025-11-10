package Producto;
import java.util.ArrayList;
import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        ArrayList <Producto> produ = new ArrayList<>();
        Scanner sc = new Scanner(System.in);
        String nombre;
        float precioUnitario;
        int cantidad;
        int meses;
        String fechaCaducidad;
        int Menu;
        boolean category = true;

        System.out.println("Ingresa el numero de productos a registrar: ");
        int productos = sc.nextInt();

        for (int i=0; i < productos; i++){
            System.out.println("Ingresa la categoria: [1]Alimento [2]Electronico");
            Menu = sc.nextInt();
            if (Menu == 1){
                category = true;
            } else if (Menu == 2){
                category = false;
            }
            if (category){
                System.out.print("Ingresa el nombre: ");
                nombre = sc.next();
                System.out.print("Ingresa el precio unitario: ");
                precioUnitario = sc.nextFloat();
                System.out.print("Ingresa la cantidad: ");
                cantidad = sc.nextInt();
                System.out.print("Ingresa la fecha de caducidad DD-MM-AAAA: ");
                fechaCaducidad = sc.next();
                Alimento al = new Alimento(nombre, precioUnitario, cantidad, fechaCaducidad);
                produ.add(al);
            } else {
                System.out.print("Ingresa el nombre: ");
                nombre = sc.next();
                System.out.print("Ingresa el precio unitario: ");
                precioUnitario = sc.nextFloat();
                System.out.print("Ingresa la cantidad: ");
                cantidad = sc.nextInt();
                System.out.print("Ingresa los meses de garantia: ");
                meses= sc.nextInt();
                Electronico el = new Electronico(nombre, precioUnitario, cantidad, meses);
                produ.add(el);
            }
        }

        for (Producto p : produ){
            System.out.println(p.mostrarDetalle());
        }

        sc.close();
    }
}