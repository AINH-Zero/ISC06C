package Minecraft;

//CLASE JUGADOR
class Jugador {
    //Atributos privados protegidos del acceso externo
    private String nombre;
    private int vida;
    private Herramienta herramienta;// Asociacion un jugador"Tiene una " herramienta
    private Inventario inventario; // Un jugador "tiene un" inventario

    //Constructor
    public Jugador(String nombre){
        this.nombre = nombre;
        this.vida = 20; //corazones
        this.inventario = new Inventario(); // Cada jugador nuevo tiene un inventario nuevo
    }

    //Getters y Setters
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getVida() {
        return vida;
    }

    public void setVida(int vida) {
        this.vida = vida;
    }

    public Inventario getInventario() {
        return inventario;
    }

    //metodo permite equipoar una herramienta a; jugador
    public void equiparHerramienta (Herramienta herramienta){
        this.herramienta = herramienta;
        System.out.println(nombre +" se equipo " + herramienta.nombre);
    }
    //Metodo con polimorfismo actuar diferente segun el tipo de herramienta
    public void minar(String bloque){
        if(herramienta != null){
            System.out.println(nombre + " intenta minar un bloque de " + bloque);
        } 
        //instanceof = verificar el tipo (polimorfismo dinamico)
            if(herramienta instanceof Pico){
                ((Pico) herramienta).minarBloque(bloque);
            }
        else {
            System.out.println(nombre + " no tiene herramienta equipada");
        }
    }
}