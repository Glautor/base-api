module Utils
    class Commons
        def primitive_element?(data)
            data.class == TrueClass ||
            data.class == FalseClass ||
            data.class == String ||
            data.class == Fixnum ||
            data.class == Float ||
            data.class == Bignum ||
            data.class == Symbol ||
            data.class == Array ||
            data.class == Hash ||
            data.class == NilClass
        end
    end
end