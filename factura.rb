class Factura
    def initialize()
        puts "Bienvenid@ al sistema de facturacion\n"
    end

    def validar_input()
        case ARGV.length
        when 0
            puts "Por favor ingrese una cantidad."
        end
    end
end

factura = Factura.new()
factura.validar_input()