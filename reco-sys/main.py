import secret
from userbase import UserBase
import recommender

ub = UserBase(secret.config)
vendors = ub.get_unique()

print(vendors)


