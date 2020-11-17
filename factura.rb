class Factura
    def initialize()
        puts "Bienvenid@ al sistema de facturacion\n"
        @cantidad = 0;
        @precio_unitario = 0.0
    end

    def validar_input()
        input_completo = true
        case ARGV.length
        when 0
            input_completo = false
            puts "Por favor ingrese una cantidad.\n"
        when 1
            input_completo = false
            puts "Por favor ingrese el precio unitario.\n"
        when 2
            input_completo = false
            puts "Por favor ingrese el estado.\n"
        end

        if(input_completo && validar_cantidad() && validar_precio_unitario())

        end

    end

    def validar_cantidad()
        @cantidad = ARGV[0].to_i
        if(@cantidad>0)
            return true
        end
        puts "Por favor ingrese una cantidad válida.\n"
        return false
    end

    def validar_precio_unitario()
        @precio_unitario = ARGV[1].to_f
        puts @precio_unitario
        if(@precio_unitario>0)
            return true
        end
        puts "Por favor ingrese un precio unitario válido.\n"
        return false
    end
end

factura = Factura.new()
factura.validar_input()