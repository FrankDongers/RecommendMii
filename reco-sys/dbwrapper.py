import pyrebase


class DBWrapper:

    def __init__(self, secret):
        config = {
            "apiKey": secret['apiKey'],
            "authDomain": secret['authDomain'],
            "storageBucket": secret['storageBucket'],
            "databaseURL": secret['databaseURL'],
            }
        self.firebase = pyrebase.initialize_app(config)
        self.db = self.firebase.database()

    def update(self):
        self.db = self.firebase.database()

    def fetch_users(self):
        users = self.db.child('users').get().val()
        return users

    def fetch_user(self, u_id):
        user = self.db.child('users').child(u_id).get().val()
        return user
