# ✅ Todo App – Flutter + GetX + Clean Architecture

Aplicación **Todo** desarrollada en Flutter con el objetivo de **practicar Clean Architecture** y el uso correcto de **GetX** para manejo de estado e inyección de dependencias.

---

## 🎯 Objetivo del proyecto

- Entender cómo separar responsabilidades en Flutter  
- Aplicar Clean Architecture sin sobreingeniería  
- Usar GetX de forma consciente (no como framework mágico)  
- Tener una base escalable para apps reales  

---

## 🧠 Arquitectura usada

Se utiliza una versión simplificada de **Clean Architecture**, dividida en 3 capas principales:

```
lib/
│
├── domain/        → Reglas de negocio (pura lógica)
├── data/          → Implementación de datos
├── presentation/  → UI + GetX
```

### 📌 Regla clave
Las dependencias **siempre apuntan hacia el dominio**.

---

## 📦 Domain (Reglas de negocio)

Contiene código **independiente de Flutter**.

### Incluye:
- **Entities** → Modelos puros  
- **Repositories (abstractos)** → Contratos  

Ejemplo:
- `Todo` (entidad)  
- `TodoRepository` (contrato)  

👉 Esta capa no sabe nada de GetX, UI, colores o frameworks.

---

## 💾 Data (Implementación)

Se encarga de **cómo** se obtienen y modifican los datos.

### Incluye:
- Implementaciones de repositorios  
- Modelos concretos  

En este proyecto:
- Repositorio en memoria (fake)  
- Fácilmente reemplazable por SQLite, API o Firebase  

👉 Cambiar la fuente de datos **no rompe la app**.

---

## 🎮 Presentation (UI + GetX)

Aquí vive Flutter y GetX.

### Incluye:
- Pages (Widgets)  
- Controllers (GetX)  

### Responsabilidades del Controller:
- Manejar estado  
- Llamar al repositorio  
- Exponer datos a la UI  

👉 No contiene reglas de negocio complejas.

---

## ⚡ ¿Cómo se usa GetX en esta app?

GetX cumple **3 roles claros**:

### 1️⃣ Estado reactivo
```dart
final todos = <Todo>[].obs;
```

- La UI se actualiza automáticamente usando `Obx`

---

### 2️⃣ Inyección de dependencias
```dart
Get.put(TodoController(TodoRepositoryImpl()));
```

- No se pasan controllers por constructores  
- Se acceden con `Get.find()`  

---

### 3️⃣ Comunicación UI ↔ lógica

La UI solo llama métodos del controller, sin conocer detalles internos.

---

## ✏️ Funcionalidades

- ➕ Crear tareas  
- ✏️ Editar nombre de tarea  
- ✅ Marcar como completada  
- 🗑️ Eliminar tarea  
- 🎨 UI con colores e íconos según estado  

---

## 🧑‍💻 Autor

Proyecto de estudio desarrollado para practicar **Flutter + Clean Architecture + GetX**.
