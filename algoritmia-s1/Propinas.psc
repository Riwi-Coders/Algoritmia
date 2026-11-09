Algoritmo sin_titulo
	Definir cuenta Como Numero
	Definir propina Como Numero
	Definir propina_total Como Numero
	Definir personas Como Numero
	Definir iva Como Numero
	Definir individual Como Numero
	Escribir 'Cuanto es el total de la cuenta?'
	Leer cuenta
	Escribir 'Cuantas personas son?'
	Leer personas
	Escribir 'Cuanto es el % de la propina?'
	Leer propina
	propina_total <- (cuenta*propina)/100
	iva = cuenta * 0.19
	total <- cuenta + propina_total + iva
	individual <- total/personas
	Escribir "Tu subtotal es de: $" cuenta " COP"
	Escribir "Tu propina es del " propina "%"
	Escribir "Tu IVA son: $" iva " COP"
	Escribir "Tu total neto es de $" total " COP"
	Escribir "Por persona se paga: $" individual " COP"
FinAlgoritmo
