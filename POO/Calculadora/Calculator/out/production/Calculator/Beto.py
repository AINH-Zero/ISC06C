import sympy
import numpy as np
import matplotlib.pyplot as plt
from tkinter import Tk, Label, Button, Entry, Toplevel, StringVar, messagebox
from sympy.utilities.lambdify import lambdify 

# --- Función de Cálculo ---
def regla_trapecio(f_str, a, b, n, resultado_var):
    try:
        # 1. Validación de entradas
        a = float(a)
        b = float(b)
        n = int(n)
        if n <= 0:
            messagebox.showerror("Error", "Usa un número de particiones mayor que 0.")
            return

        # 2. Definir y lambdificar la función
        X = sympy.Symbol('x')
        f_sym = sympy.sympify(f_str)
        # Convertimos la función simbólica a una función rápida de NumPy
        f_num = lambdify(X, f_sym, "numpy") 
        
        # 3. Cálculo de la integral (h y x_vals)
        h = (b - a) / n
        x_vals = np.linspace(a, b, n + 1)
        y_vals = f_num(x_vals) 
        
        # 4. Fórmula de la Regla del Trapecio
        area = (h / 2) * (y_vals[0] + 2 * np.sum(y_vals[1:-1]) + y_vals[-1])
        
        # 5. Mostrar el resultado en la interfaz
        resultado_str = f"Aproximación de la integral = {area:.6f}"
        resultado_var.set(resultado_str)
        
        # 6. Generar la gráfica
        plt.figure(figsize=(8, 6))
        
        # Curva de la función (color azul)
        x_plot = np.linspace(a, b, 500)
        y_plot = f_num(x_plot)
        plt.plot(x_plot, y_plot, label=f'f(x) = {f_str}', color='blue')
        
        # Dibujar los trapecios (color naranja)
        for i in range(n):
            xi = x_vals[i]
            xi1 = x_vals[i+1]
            fi = y_vals[i]
            fi1 = y_vals[i+1]
            
            # Sombra de cada trapecio
            plt.fill([xi, xi1, xi1, xi], [0, 0, fi1, fi], color='orange', alpha=0.5) 
            # Líneas del trapecio
            plt.plot([xi, xi1], [fi, fi1], 'r--') 

        # Puntos de muestreo (en rojo)
        plt.scatter(x_vals, y_vals, color='red', s=20, zorder=5) 
        
        plt.title("Regla del Trapecio Compuesta") 
        plt.xlabel("x")
        plt.ylabel("f(x)")
        plt.grid(True)
        plt.legend()
        plt.show()

    except ValueError:
        messagebox.showerror("Error de Entrada", "Los límites (a o b) o n deben ser números válidos.")
    except sympy.SympifyError:
        messagebox.showerror("Error de Sintaxis", "La función no es una expresión válida. Revisa la sintaxis (ej: x**2).")
    except NameError:
         messagebox.showerror("Error de Variable", "Asegúrate de escribir 'x' correctamente en la función.")
    except Exception as e:
        messagebox.showerror("Error Desconocido", f"Ocurrió un error: {e}")

# --- Función que lanza la ventana de la Interfaz ---
def abrir_trapecio(parent_window):
    # Crear la nueva ventana para el módulo
    trapecio_window = Toplevel(parent_window)
    trapecio_window.title("Calculadora de Integrales - Regla del Trap.")

    # Variables de control
    funcion_var = StringVar(trapecio_window, value="x**2+3*x+2")
    a_var = StringVar(trapecio_window, value="0")
    b_var = StringVar(trapecio_window, value="5")
    n_var = StringVar(trapecio_window, value="50")
    resultado_var = StringVar(trapecio_window, value="Esperando cálculo...")

    # --- Etiquetas y Campos de Entrada ---
    
    # Función f(x)
    Label(trapecio_window, text="Ingrese la función f(x):").grid(row=0, column=0, padx=5, pady=5, sticky="w")
    Entry(trapecio_window, textvariable=funcion_var, width=40).grid(row=0, column=1, padx=5, pady=5)
    
    # Límite inferior (a)
    Label(trapecio_window, text="Límite inferior (a):").grid(row=1, column=0, padx=5, pady=5, sticky="w")
    Entry(trapecio_window, textvariable=a_var, width=40).grid(row=1, column=1, padx=5, pady=5)
    
    # Límite superior (b)
    Label(trapecio_window, text="Límite superior (b):").grid(row=2, column=0, padx=5, pady=5, sticky="w")
    Entry(trapecio_window, textvariable=b_var, width=40).grid(row=2, column=1, padx=5, pady=5)
    
    # Número de particiones (n)
    Label(trapecio_window, text="Número de particiones (n):").grid(row=3, column=0, padx=5, pady=5, sticky="w")
    Entry(trapecio_window, textvariable=n_var, width=40).grid(row=3, column=1, padx=5, pady=5)

    # --- Botón de Cálculo ---
    Button(trapecio_window, text="Calcular Integral", 
           command=lambda: regla_trapecio(
               funcion_var.get(), a_var.get(), b_var.get(), n_var.get(), resultado_var
           )).grid(row=4, column=0, columnspan=2, pady=10)

    # --- Resultado ---
    Label(trapecio_window, textvariable=resultado_var, font=('Arial', 12, 'bold')).grid(row=5, column=0, columnspan=2, pady=5)

# --- Bloque Principal ---
if __name__ == "__main__":
    root = Tk()
    root.withdraw() # Oculta la ventana principal
    abrir_trapecio(root)
    root.mainloop()