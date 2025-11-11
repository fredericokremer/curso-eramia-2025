import bentoml
import pickle

model = pickle.load(open('data/models/model.pickle', 'rb'))

saved_model = bentoml.sklearn.save_model(
        'bbb-model', 
        model,
        signatures={
            "predict": {"batchable": True},
            "predict_proba": {"batchable": True}
        }
    )

print(f"Model tag: {saved_model}")