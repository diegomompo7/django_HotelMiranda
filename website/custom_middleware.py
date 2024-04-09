class CustomBackend(BaseBackend):
 
    def authenticate(self, request, username=None, token=None):
        try:
            user = User.objects.get(username=username)
        except User.DoesNotExist:
            return None
        check_token = Token.objects.filter(user=user, token=token).exists()
        if check_token:
            return user
        return None

    def get_user(self, user_id):
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExist:
            return None