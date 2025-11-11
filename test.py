import requests

smiles = "N[C@@H](Cc1ccc(O)c(O)c1)C(=O)O"

response = requests.post(
    "https://curso-eramia-2025.onrender.com/classify",
    json={"smiles": smiles},
    headers={"Content-Type": "application/json"}
)

print(response.text, response.status_code)