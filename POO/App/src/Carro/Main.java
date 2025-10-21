package Carro;

public class Main {
    public static void main(String[] args) {    
        Auto auto = new Auto("Forest", "BYD", 2025, "Eléctrico");
        Moto moto = new Moto("Ovni Track", "Vento", 2026, false);
        Camion camion = new Camion("Optimus Prime", "Autobots", 2026, 100.0);

        auto.mostrarInfo();
        auto.arrancar();
        auto.frenar();

        moto.mostrarInfo();
        moto.arrancar();
        moto.frenar();

        camion.mostrarInfo();
        camion.arrancar();
        camion.frenar();
    }
}
