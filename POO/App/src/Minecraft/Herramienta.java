package Minecraft;

class Herramienta {
    //Atributos: Caracteristicas o propiedades de la clase u objeto
    protected String nombre;
    protected int durabilidad;

    //Constructor: se ejecuta al crear un objeto de la calse
    public Herramienta(String nombre, int durabilidad){
        this.nombre = nombre; //this es para hacer referencia
        this.durabilidad = durabilidad;
        //this.nombre es como decir 'el nombre de ese objeto es'
    }

    //Getter Setter
    public String getNombre() {
        return nombre;
    }

    public int getDurabilidad() {
        return durabilidad;
    }

    public void setDurabilidad(int durabilidad) {
        this.durabilidad = durabilidad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    //Metodo: define el comportamiento o una accio
        public void usar(){
            if (durabilidad > 0) {
            durabilidad--;
            System.out.println( nombre +" se ha usado. Su durabilidad es de" + durabilidad);
        } else {
            System.out.println(nombre +" se ha roto");
        }
    }
}