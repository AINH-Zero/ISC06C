public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Hello, World!");

        int edad2 = 20;

        if(edad2 >= 18){
            System.out.println("Eres mayor de edad");
        } else {
            System.out.println("Eres menor de edad");
        }

        int dia = 3;
        switch(dia){
            case 1 -> System.out.println("Lunes");
            case 2 -> System.out.println("Martes");
            case 3 -> System.out.println("Miercoles");
            case 4 -> System.out.println("Jueves");
            case 5 -> System.out.println("Viernes");
            case 6 -> System.out.println("Sabado");
            case 7 -> System.out.println("Domingo");
            default -> System.out.println("Dia no valido");
        }
    }
}





