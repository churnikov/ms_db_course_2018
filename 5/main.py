import json

import redis

with open('config.json', 'r') as f:
    conf = json.load(f)
    HOST, PORT = conf['host'], conf['port']

r = redis.Redis(host=HOST, port=PORT, db=0, encoding='utf-8')

r.set('so', 'does the string come out of a file or a socket? '
                  'could you please post code examples of how the string '
                  'is encoded end decoded before it is send through '
                  'the socket/filehandler?')

# GET
print('Plain GET')
print(r.get('so').decode(), end='\n\n')

# GETRANGE
print('GETRANGE')
print(r.getrange('so', 0, 10).decode(), end='\n\n')

# STRLEN
print('STRLEN')
print(r.strlen('so'), end='\n\n')

# SETRANGE
print('SETRANGE')
print(r.getrange('so', 0, 50).decode())
print('Replacing..')
r.setrange('so', 0, 'MUCH REPLACEMENT SUCH NOSQL WOW')
print(r.getrange('so', 0, 50).decode(), end='\n\n')

# HMSET
print('HMSET')
print(r.hmset('hm_test', {'a' : 1, 'b': 'xyi', 'c': 'wtf', 'd': 42}))
# HMGET
print('HMGET')
print(r.hmget('hm_test', ['a', 'b']))
