Algoritmo ValidarRegistro
	Definir edad Como Entero
	Definir respuesta Como Caracter
	Escribir "¿Cuantos años tienes?"
	Leer edad
	Escribir "¿Aceptas los termino? (S/N)"
	leer respuesta
	respuesta <- Mayusculas(respuesta)
	Si edad >= 14 y (respuesta = "S" o respuesta ="s") Entonces
		Escribir "Registro exitoso"
	SiNo
		Escribir "No puedes registrarte"
	FinSi
FinAlgoritmo
