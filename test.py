import json

for i in range(0,100):
    for elem in json.load(open("test.json", "r")):
        print elem["title"];
