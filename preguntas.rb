=begin
	1.descripcion del juego
	2.Preguntar al usuario si desea jugar
		2.1 Si teclea Enter, irse a (3)
		2.2 Si no salir del juego
	3.Cargar Archivo de preguntas y respuestas
	4.Iniciar el lanzamiento de preguntas
		4.1 Si acierta, sumar acierto, volver a (4)
		4.2 si no acierta, no sumar acierto, preguntar si desea salir o continuar
	5.Finalizar el lanzamiento de preguntas
	6.Terminar Juego
	7.Mostrar puntaje
 
	
=end


class Juego

	attr_accessor :preguntas
	attr_accessor :respuestas
	attr_accessor :archivo

		def initialize

			@preguntas=[]
			@respuestas=[]
			@archivo=[]

		end


		def cargarjuego(txt)

			File.open(txt, 'r') do |f1|

					  cont=0
					  while linea = f1.gets
							  @archivo[cont]=linea.chomp
							  cont=cont+1
					  end


			end

		end



				def cargarP
				 	cont=0
				 	linea=0
				    while (linea< archivo.length)

				    	@preguntas[cont]=archivo[linea]
				    	cont+=1
				    	linea+=3

				    end

				end



				def cargarR
				 	cont=0
				 	linea=1
				    while (linea< archivo.length)

				    	@respuestas[cont]=archivo[linea]
				    	cont+=1
				    	linea+=3

				    end

				end






end


puts "Bienvenido , Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!"
puts "Para comenzar pulsa la tecla <<Enter>>"
print ">>"
enter= gets.chomp
puts



j= Juego.new
j.cargarjuego('fichero.txt')
j.cargarP
j.cargarR




contador=0
aciertos=0
    while (contador<=j.preguntas.length)


    		if contador==j.preguntas.length
    			puts "EL JUEGO HA TERMINADO"
    			puts "TOTAL PUNTOS #{aciertos}"
				break
    		end

    		puts
			puts "DEFINICION==> #{j.preguntas[contador]}"
			print "RESPUESTA==>"
    		respuesta2= gets.chomp.downcase

    			if respuesta2 != j.respuestas[contador]

    				puts "<<RESPUESTA INCORRECTA, TRATA DENUEVO>>"
    				puts
    				print "desea continuar  (s/n)? > "
    				s=gets.chomp.downcase
    					if (s=="n")
	    					puts "EL JUEGO HA TERMINADO"
	    					puts "TOTAL ACIERTOS #{aciertos}"
							break
						end

    			else
    				puts "<<RESPUESTA CORRECTA>>"
    				puts
    				print "desea continuar  (s/n)? > "
    				s=gets.chomp.downcase
    				aciertos+=1

    					if (s=="s")
							contador+=1
						else
							puts "EL JUEGO HA TERMINADO"
    						puts "TOTAL ACIERTOS= #{aciertos}"
							break

						end
    			end

    		
    	end



