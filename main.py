import requests

response = requests.get('http://docs.google.com/document/d/e/2PACX-1vQGUck9HIFCyezsrBSnmENk5ieJuYwpt7YHYEzeNJkIb9OSDdx-ov2nRNReKQyey-cwJOoEKUhLmN9z/pub')
if response.status_code == 200:
    print("Success!")
    print(response.json())
else:
    print(f"An error has occurred: {response.status_code}")