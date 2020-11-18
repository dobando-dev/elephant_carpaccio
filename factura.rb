class Factura
    def initialize()
        puts "Bienvenid@ al sistema de facturacion\n"
        @cantidad = 0;
        @precio_unitario = 0.0
        @estados = {"CA"=>8.25, "UT"=>0, "NV"=>0, "TX"=>0, "AL"=>0}
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

        return input_completo && validar_cantidad() && validar_precio_unitario() && validar_estado()
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
        if(@precio_unitario>0)
            return true
        end
        puts "Por favor ingrese un precio unitario válido.\n"
        return false
    end

    def validar_estado()
        if(@estados.include?(ARGV[2]))
            return true
        end
        puts "Por favor ingrese un estado válido.\n"
        return false
    end

    def calcular_monto_total()
        monto = @cantidad * @precio_unitario
        puts "El monto total es #{monto}\n"
        return monto
    end

    def calcular_impuesto(monto_total)
        estado = ARGV[2]
        impuesto = monto_total*(@estados[estado]/100)
        puts "El impuesto para el estado #{estado} es #{impuesto}\n"
        return impuesto
    end

    def calcular_descuento(monto_total)
        descuento = 0.0
        porcentaje = 0
        case monto_total
        when 1000...5000 then porcentaje = 3
        end

        if(porcentaje!=0)
            descuento = monto_total * (porcentaje/100.0)
            puts "Se aplica un descuento de #{porcentaje}% por un monto de #{descuento}"
        end
        return descuento
    end

    def facturar()
        monto_total = calcular_monto_total()
        impuesto = calcular_impuesto(monto_total)
        descuento = calcular_descuento(monto_total)
        total = monto_total + impuesto - descuento
        puts "El monto total es #{total}"
    end
end

factura = Factura.new()
if(factura.validar_input())
    factura.facturar()
end