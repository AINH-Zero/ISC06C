import java.util.Scanner;
import java.lang.Math;

public class Ejercicios2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Bienvenido :)\nQue quieres ver\n1- Variables\n2-IFS y SWITCH\n3- Ciclos\n4- Funciones\n5- Arreglos");
        int menu1 = sc.nextInt();
        if (menu1 == 1){
            /*
            VARIABLES
            1. Programa que pida la temperatura en grados Celsius y la convierta a Fahrenheit.
            Fórmula: F = (C * 9/5) + 32
            2. Solicitar base y altura, calcular el área con la fórmula:
            Área = (base * altura) / 2
            */
            System.out.println("Que programa quieres\n1. Programa que pida la temperatura en grados Celsius y la convierta a Fahrenheit\n2. Solicitar base y altura y calcular el área");
            int menuV = sc.nextInt();
            if (menuV == 1){
                System.out.print("Ingresa los celsius: ");
                double celsius = sc.nextDouble();
                System.out.println(Far_Cel(celsius) + " grados Fahrenheit");
            } else if(menuV == 2){
                System.out.print("Ingresa la base: ");
                double base = sc.nextDouble();
                System.out.print("Ingresa la altura: ");
                double altura = sc.nextDouble();
                System.out.println("El area es: " + area(base, altura));
            }
        } else if(menu1 == 2){
            /*
            IFS Y SWITCH
            1. Leer un número entero y mostrar si es par o impar. p_i
            2. Leer tres números y mostrar cuál es el mayor. may
            3. Programa que muestre un menú simple: menuE
            1. Sumar
            2. Restar
            3. Multiplicar
            4. Dividir
            El usuario elige la opción y se realiza la operación entre dos números.
            */
            System.out.println("Que programa quieres\n1. Par o Impar\n2. El mayor de tres numeros\n3. Calculadora simple");
            int menuIS = sc.nextInt();
            if(menuIS == 1){
                System.out.print("Ingresa un numero entero: ");
                int num = sc.nextInt();
                p_i(num);
            } else if (menuIS == 2){
                System.out.print("Ingresa el primer numero: ");
                double n1 = sc.nextDouble();
                System.out.print("Ingresa el segundo numero: ");
                double n2 = sc.nextDouble();
                System.out.print("Ingresa el tercer numero: ");
                double n3 = sc.nextDouble();
                may(n1, n2, n3);
            } else if (menuIS == 3){
                System.out.println("Menu\n1. Sumar\n2. Restar\n3. Multiplicar\n4. Dividir");
                int op = sc.nextInt();
                System.out.print("Ingresa el primer numero: ");
                double n1 = sc.nextDouble();
                System.out.print("Ingresa el segundo numero: ");
                double n2 = sc.nextDouble();
                menuE(op, n1, n2);
            }
        } else if(menu1 == 3){
            /*
            CICLOS
            1. Pedir un número y mostrar su tabla del 1 al 10 usando for.
            2. Pedir un número N y mostrar la suma de todos los números del 1 hasta N usando while.
            */
            System.out.println("Que programa quieres\n1. Tabla de multiplicar\n2. Suma del 1 hasta N");
            int menuC = sc.nextInt();
            if (menuC == 1){
                System.out.print("Ingresa un numero para ver su tabla de multiplicar: ");
                int num = sc.nextInt();
                tablaMultiplicar(num);
            } else if (menuC == 2){
                System.out.print("Ingresa un numero N para sumar del 1 hasta N: ");
                int num = sc.nextInt();
                sumaHastaN(num);
            }
        } else if(menu1 == 4){
            /*
            FUNCIONES
            1. Crear una función que reciba el radio y devuelva el área.
            Fórmula: π * r^2
            2. Función que reciba un número entero y regrese true si es primo, false en caso contrario.
            3. Función que reciba horas y devuelva el equivalente en minutos y segundos.
            */
            System.out.println("Que programa quieres\n1. Area de un circulo\n2. Numero primo\n3. Convertir horas a minutos y segundos");
            int menuF = sc.nextInt();
            if(menuF == 1){
                System.out.print("Ingresa el radio del circulo: ");
                double radio = sc.nextDouble();
                System.out.println("El area es: " + areaCirculo(radio));
            } else if (menuF == 2){
                System.out.print("Ingresa un numero para saber si es primo: ");
                int num = sc.nextInt();
                if(esPrimo(num)){
                    System.out.println("Es primo");
                } else {
                    System.out.println("No es primo");
                }
            } else if (menuF == 3){
                System.out.print("Ingresa las horas a convertir: ");
                double horas = sc.nextDouble();
                convertirTiempo(horas);
            }
        } else if(menu1 == 5){
            /*
            Arreglos
            1. Pedir al usuario N calificaciones, almacenarlas en un arreglo y calcular el promedio.
            2. Llenar un arreglo con números y determinar cuál es el mayor.
            3. Pedir N números, guardarlos en un arreglo y mostrarlo en orden inverso.
            */
            System.out.println("Que programa quieres\n1. Promedio de calificaciones\n2. Encontrar el mayor en un arreglo\n3. Mostrar arreglo en orden inverso");
            int menuA = sc.nextInt();
            if(menuA == 1){
                promedioCalificaciones(sc);
            } else if (menuA == 2){
                mayorEnArreglo(sc);
            } else if (menuA == 3){
                arregloInverso(sc);
            }
        }
        sc.close();
    }
    public static double Far_Cel(double celsius){
        double val = (celsius * 9.0/5.0) + 32;
        return val;
    }
    public static double area(double base, double altura){
        double val = (base * altura) / 2;
        return val;
    }
    /*
    IFS Y SWITCH
    */
    public static void p_i(int num){
        if (num % 2 == 0){
            System.out.println("Es par");
        } else {
            System.out.println("Es impar");
        }
    }
    public static void may(double num1, double num2, double num3){
        if (num1 >= num2 && num1 >= num3){
            System.out.println(num1 + " es el mayor");
        } else if (num2 >= num1 && num2 >= num3){
            System.out.println(num2 + " es el mayor");
        } else {
            System.out.println(num3 + " es el mayor");
        }
    }
    public static void menuE(int op, double n1, double n2){
        double resultado = 0;
        switch(op){
            case 1:
                resultado = n1 + n2;
                System.out.println("Resultado: " + resultado);
                break;
            case 2:
                resultado = n1 - n2;
                System.out.println("Resultado: " + resultado);
                break;
            case 3:
                resultado = n1 * n2;
                System.out.println("Resultado: " + resultado);
                break;
            case 4:
                if(n2 != 0){
                    resultado = n1 / n2;
                    System.out.println("Resultado: " + resultado);
                } else {
                    System.out.println("No se puede dividir por cero.");
                }
                break;
            default:
                System.out.println("Opcion no valida");
                break;
        }
    }
    /*
    CICLOS
    */
    public static void tablaMultiplicar(int num){
        for(int i = 1; i <= 10; i++){
            System.out.println(num + " x " + i + " = " + (num * i));
        }
    }
    public static void sumaHastaN(int n){
        int suma = 0;
        int i = 1;
        while(i <= n){
            suma += i;
            i++;
        }
        System.out.println("La suma es: " + suma);
    }
    /*
    FUNCIONES
    */
    public static double areaCirculo(double radio){
        return Math.PI * radio * radio;
    }
    public static boolean esPrimo(int num){
        if(num <= 1){
            return false;
        }
        for(int i = 2; i <= Math.sqrt(num); i++){
            if(num % i == 0){
                return false;
            }
        }
        return true;
    }
    public static void convertirTiempo(double horas){
        int minutos = (int)(horas * 60);
        double restantes = horas - (minutos/60);
        double segundos = restantes * 3600;
        System.out.println(horas + " horas son " + minutos + " minutos y " + segundos + " segundos.");
    }
    /*
    ARREGLOS
    */
    public static void promedioCalificaciones(Scanner sc){
        System.out.print("Cuantas calificaciones vas a ingresar?: ");
        int n = sc.nextInt();
        double[] calificaciones = new double[n];
        double suma = 0;
        for(int i = 0; i < n; i++){
            System.out.print("Ingresa la calificacion " + (i+1) + ": ");
            calificaciones[i] = sc.nextDouble();
            suma += calificaciones[i];
        }
        System.out.println("El promedio es: " + (suma/n));
    }
    public static void mayorEnArreglo(Scanner sc){
        System.out.print("Cuantos numeros vas a ingresar?: ");
        int n = sc.nextInt();
        int[] numeros = new int[n];
        for(int i = 0; i < n; i++){
            System.out.print("Ingresa el numero " + (i+1) + ": ");
            numeros[i] = sc.nextInt();
        }
        int mayor = numeros[0];
        for(int i = 1; i < n; i++){
            if(numeros[i] > mayor){
                mayor = numeros[i];
            }
        }
        System.out.println("El numero mayor es: " + mayor);
    }
    public static void arregloInverso(Scanner sc){
        System.out.print("Cuantos numeros vas a ingresar?: ");
        int n = sc.nextInt();
        int[] numeros = new int[n];
        for(int i = 0; i < n; i++){
            System.out.print("Ingresa el numero " + (i+1) + ": ");
            numeros[i] = sc.nextInt();
        }
        System.out.println("El arreglo en orden inverso es:");
        for(int i = n - 1; i >= 0; i--){
            System.out.print(numeros[i] + " ");
        }
        System.out.println();
    }
}