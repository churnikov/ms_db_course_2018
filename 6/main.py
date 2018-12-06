from pprint import pprint

import pymongo

client = pymongo.MongoClient('localhost', 27017)

db = client.test

posts = db.get_collection('restaurants')

# 1
print('COUNT')
print(posts.count_documents({}))
print('-----------------------------------------------------')

# 2
print('Print first document')
pprint(posts.find_one())
print('-----------------------------------------------------')

# 3
print("Select 3 places from 'borough': 'Bronx'")
print(posts.count_documents({'borough': 'Bronx'}))
for p in posts.find({'borough': 'Bronx'}, limit=3):
    pprint(p)
print('-----------------------------------------------------')

# 4
print('List of distinct values for key among all documents in this collection.')
pprint(posts.distinct('cuisine'))
print('-----------------------------------------------------')

# 5
print('Count all cuisines')
cuisine = posts.distinct('cuisine')
cuisine_count = {
    cu: posts.count_documents({'cuisine': cu})
    for cu in cuisine
}
pprint(cuisine_count)

