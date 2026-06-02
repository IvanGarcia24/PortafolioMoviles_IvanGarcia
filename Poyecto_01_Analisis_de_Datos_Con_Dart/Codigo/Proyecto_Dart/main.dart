import 'dart:io';
import 'dart:convert';

// 1. CLASE REGISTRO (Modelado de datos)
class Registro {
  String nombre;
  int edad;
  double salario;

  Registro({required this.nombre, required this.edad, required this.salario});

  // Constructor factory para instanciar desde JSON aplicando Null Safety
  factory Registro.fromJson(Map<String, dynamic> json) {
    return Registro(
      nombre: json['nombre'] ?? 'Desconocido', 
      edad: json['edad'] ?? 0,
      salario: (json['salario'] ?? 0.0).toDouble(),
    );
  }

  // Método para convertir el objeto a JSON nuevamente
  Map<String, dynamic> toJson() => {
    'nombre': nombre,
    'edad': edad,
    'salario': salario
  };

  @override
  String toString() => 'Nombre: $nombre | Edad: $edad | Salario: \$${salario.toStringAsFixed(2)}';
}
// 2. FUNCIONES DE PROCESAMIENTO
// Función para leer el archivo JSON y cargar la lista
List<Registro> cargarDatos(String ruta) {
  try {
    final archivo = File(ruta);
    if (!archivo.existsSync()) {
      print("Error: No se encontró el archivo '$ruta'.");
      return [];
    }
    final contenido = archivo.readAsStringSync();
    final List<dynamic> datosJson = jsonDecode(contenido);
    
    return datosJson.map((item) => Registro.fromJson(item)).toList();
  } catch (e) {
    print("Error al cargar el archivo: $e");
    return [];
  }
}

// Función para buscar por nombre
void buscarPorNombre(List<Registro> registros, String nombreBuscado) {
  var resultados = registros.where((r) => r.nombre.toLowerCase() == nombreBuscado.toLowerCase()).toList();
  
  if (resultados.isEmpty) {
    print("No se encontraron registros con el nombre '$nombreBuscado'.");
  } else {
    resultados.forEach((r) => print(r));
  }
}

// Función para filtrar por salario mínimo
void filtrarPorSalario(List<Registro> registros, double salarioMinimo) {
  var resultados = registros.where((r) => r.salario >= salarioMinimo).toList();
  
  if (resultados.isEmpty) {
    print("Ningún empleado gana más de \$${salarioMinimo}");
  } else {
    resultados.forEach((r) => print(r));
  }
}

// Función para calcular estadísticas y exportar JSON
void generarReporteYExportar(List<Registro> registros) {
  if (registros.isEmpty) {
    print("No hay datos para generar estadísticas.");
    return;
  }

  double totalSalarios = 0;
  int edadMinima = registros.first.edad;
  int edadMaxima = registros.first.edad;

  for (var r in registros) {
    totalSalarios += r.salario;
    if (r.edad < edadMinima) edadMinima = r.edad;
    if (r.edad > edadMaxima) edadMaxima = r.edad;
  }

  double promedioSalario = totalSalarios / registros.length;

  print("\n--- ESTADÍSTICAS ---");
  print("Total de registros: ${registros.length}");
  print("Promedio de salario: \$${promedioSalario.toStringAsFixed(2)}");
  print("Edad mínima: $edadMinima años");
  print("Edad máxima: $edadMaxima años");

  // Crear el mapa para el resumen JSON
  Map<String, dynamic> resumen = {
    "total_registros": registros.length,
    "promedio_salario": promedioSalario,
    "edad_minima": edadMinima,
    "edad_maxima": edadMaxima
  };

  try {
    File('resumen.json').writeAsStringSync(jsonEncode(resumen));
    print("¡Reporte exportado exitosamente como 'resumen.json' en tu carpeta!");
  } catch (e) {
    print("Error al guardar el reporte: $e");
  }
}


// 3. FUNCIÓN PRINCIPAL (Menú Interactivo)

void main() {
  print("Cargando base de datos...");
  List<Registro> empleados = cargarDatos('datos.json');

  if (empleados.isEmpty) {
    print("No se pudo iniciar el sistema. Revisa que 'datos.json' exista en la carpeta.");
    return;
  }

  bool ejecutando = true;

  while (ejecutando) {
    print("\n=== SISTEMA DE ANÁLISIS DE DATOS ===");
    print("1. Ver todos los registros");
    print("2. Buscar registro por nombre");
    print("3. Filtrar por salario mínimo");
    print("4. Generar reporte estadístico y exportar");
    print("5. Salir");
    stdout.write("Elige una opción: ");
    
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        print("\n--- LISTA DE EMPLEADOS ---");
        empleados.forEach((e) => print(e));
        break;
      case '2':
        stdout.write("Ingresa el nombre a buscar: ");
        String nombre = stdin.readLineSync() ?? '';
        print("\n--- RESULTADOS DE BÚSQUEDA ---");
        buscarPorNombre(empleados, nombre);
        break;
      case '3':
        stdout.write("Ingresa el salario mínimo: ");
        // Null Safety en acción: previene crashes si escribes letras
        double salario = double.tryParse(stdin.readLineSync() ?? '') ?? -1;
        if (salario >= 0) {
          print("\n--- EMPLEADOS CON SALARIO MAYOR A \$${salario} ---");
          filtrarPorSalario(empleados, salario);
        } else {
        }
        break;
      case '4':
        generarReporteYExportar(empleados);
        break;
      case '5':
        print("Saliendo del sistema... ¡Mucho éxito con tu entrega!");
        ejecutando = false;
        break;
      default:
        print("Opción no válida. Intenta de nuevo.");
    }
  }
}