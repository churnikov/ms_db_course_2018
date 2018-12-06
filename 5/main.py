import json

import redis

with open('config.json', 'r') as f:
    conf = json.load(f)
    HOST, PORT = conf['host'], conf['port']

r = redis.Redis(host=HOST, port=PORT, db=0)

r.ping()