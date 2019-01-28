import math
import random
import numpy as np
import pandas as pd

class Recommender:
    def __init__(self, n_voters=3, n_pulled=None):
        self.n_voters = n_voters
        self.n_pulled = None
        self.dataset = pd.DataFrame([])

    def fit(self, user_base):
        self.dataset = user_base
        return None

    def predict(self, u_id, n_top=3):
        tops = self.weighted_scores(u_id, n_top)

        return tops

    def pearson(self, A, B):
        A_mean = np.average(A)
        B_mean = np.average(B)
        A_sd = np.std(A)
        B_sd = np.std(B)

        result = sum((a - A_mean) * (b - B_mean) for a, b in zip(A, B)) / A_sd / B_sd
        return result

    def total_pearson_score(self, user_id):

        agg_scores = []
        if self.n_pulled is not None:
            for i in range(self.n_pulled):
                r = random.randint(0, len(self.dataset))
                agg_scores.append(r, self.pearson(self.dataset.iloc[user_id], self.dataset.iloc[r]))
        else:
            for i in len(self.dataset.index):
                agg_scores.append((i, self.pearson(self.dataset.iloc[user_id], self.dataset.iloc[i])))

        return sorted(agg_scores, reverse=True)[:self.n_voters]

    def weighted_scores(self, user_id, n_top):
        n_closest = np.array(self.total_person_score(user_id))

        scores = []
        for col in self.dataset.columns:
            event_n = np.array(self.dataset.loc[col])
            val = np.dot(event_n, n_closest)
            scores.append((col, val))

        return sorted(scores, reverse=True)[:n_top]
