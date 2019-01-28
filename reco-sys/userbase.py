import dbwrapper
import pandas as pd
import numpy as np
from collections import OrderedDict


class UserBase:

    def __init__(self, config):
        self.db = dbwrapper.DBWrapper(config)
        self.users = self.db.fetch_users()

    def get_as_vendors_list(self):
        ids, vendors = self.get_unique()
        data = np.reshape([[self.count_unique(u_id, vendors)] for u_id in ids], (len(ids), len(vendors)))
        output = pd.DataFrame(columns=vendors, index=ids, data=data)
        print(output)

    def get_unique(self):
        ids = []
        unique_vendors = []
        users_list = self.users
        content = list(users_list.items())

        for i in users_list:
            if i != "dummy":
                ids.append(i)
            for j in range(len(users_list)):
                if content[i][1] is not None:
                    item = content[j][1]['transactions'][0]['vendor']
                    print(item)
                    if item not in unique_vendors:
                        unique_vendors.append(item)
        print(unique_vendors)
        print(ids)



    def count_unique(self, user, unique_vendors):
        user_purch = self.db.fetch_user(user)['transactions']

        empties = [0] * len(unique_vendors)

        for item in user_purch:
            index = unique_vendors.index(item['vendor'])
            if empties[index] == 0:
                empties[index] = 1

        return empties



