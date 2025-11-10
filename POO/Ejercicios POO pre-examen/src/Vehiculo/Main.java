package Vehiculo;
import java.util.ArrayList;
import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        ArrayList <Vehiculo> cars = new ArrayList<>();
        Scanner sc = new Scanner(System.in);
        String Marca;
        String Modelo;
        float precioBase;

        System.out.println("Ingresa el numero de carros a registrar: ");
        int carros = sc.nextInt();

        for (int i=0; i < carros; i++){
            System.out.print("Ingresa la marca: ");
            Marca = sc.next();
            System.out.print("Ingresa el modelo: ");
            Modelo = sc.next();
            System.out.print("Ingresa el precio base: ");
            precioBase = sc.nextInt();
            Auto car = new Auto(Marca, Modelo, precioBase);
            cars.add(car);
        }

        for (Vehiculo a : cars){
            System.out.println(a.mostrarDatos());
        }

        sc.close();
    }
}