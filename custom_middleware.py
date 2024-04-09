class CustomMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # Código que se ejecutará en cada solicitud entrante
        response = self.get_response(request)

        # Generar un token aleatorio
        token = secrets.token_hex(16)  # Genera un token hexadecimal de 16 bytes (32 caracteres)
        
        # Aquí puedes almacenar el token en la sesión del usuario, en una base de datos, o en cualquier otro lugar necesario.
        # Por ejemplo, podrías agregarlo a request para que esté disponible en las vistas posteriores.
        response["X-Auth-Token"] = token

        return response