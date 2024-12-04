# Meteor.js

Meteor is a full-stack JavaScript platform for developing modern web and mobile applications. Meteor includes a key set of technologies for building connected-client reactive applications, a build tool, and a curated set of packages from the Node.js and general JavaScript community. Data persistence is done with MongoDB.

https://docs.meteor.com/about/what-is.html

### Publications and subscriptions

https://guide.meteor.com/data-loading

In a traditional, HTTP-based web application, the client and server communicate in a “request-response” fashion. Typically the client makes RESTful HTTP requests to the server and receives HTML or JSON data in response, and there’s no way for the server to “push” data to the client when changes happen at the backend.

Meteor is built from the ground up on the [Distributed Data Protocol (DDP)](https://github.com/meteor/meteor/blob/devel/packages/ddp/DDP.md) to allow data transfer in both directions. Building a Meteor app doesn’t require you to set up REST endpoints to serialize and send data. Instead you create publication endpoints that can push data from server to client.

## Installation

```bash
nvm use stable
npx meteor

export PATH=${HOME}/.meteor:$PATH

meteor --version
meteor --help
```

## Read the doc on the CLI


https://docs.meteor.com/cli/

## Getting started with a simple Vue application

https://docs.meteor.com/tutorials/vue/meteorjs3-vue3-vue-meteor-tracker.html

```bash

mkdir -p ~/github/meteor
cd ~/github/meteor
meteor create --vue simple-todos-vue --release=3.0.2
cd simple-todos-vue
meteor npm install
meteor --port 3000
```


Inspect the running application from an additionnal (shell) console
```bash
meteor node -e "console.log(process.versions)"
```

```bash
meteor shell
```

Install also https://www.mongodb.com/try/download/shell



### The full example

> NB: stop the previous application

```bash
nvm use install
export PATH=${HOME}/.meteor:$PATH
mkdir -p ~/github/meteor
cd ~/github/meteor
git clone https://github.com/meteor/meteor3-vue3
cd meteor3-vue3
meteor npm install
npm audit fix
```

Inspect the project layout
```bash
tree .
tree -L 2 client server
```


Run the service
```bash
meteor
```

Open http://localhost:3000 in your browser

> NB: username `meteorite` and password `password` are defined into https://github.com/meteor/meteor3-vue3/blob/main/server/main.js#L7

Open http://localhost:3000 in your second browser (to emulate a second user)

Add new todo tasks

Remove todo tasks

What's happens into the two clients ?

## Inspect the MongoDB collections

https://www.mongodb.com/docs/manual/crud/


```bash
./mongosh mongodb://127.0.0.1:3001/meteor
```

```
help
use meteor
show collections

db.getCollectionNames()

db.getCollectionInfos()

db.runCommand(
   {
       listCollections: 1.0,
       authorizedCollections: true,
       nameOnly: true
   }
)

db.tasks.find()
db.users.find()
```

Insert two new `task` documents into the `tasks` collection.
```
db.tasks.insertOne(
  {
    text: 'Tenth Task',
    userId: 'KRsaNNmogqm7Jfw7Y',
    createdAt: ISODate('2024-12-10T00:00:00.000Z')
  }
db.tasks.insertOne(
  {
    text: 'Tenth Task',
    userId: 'KRsaNNmogqm7Jfw7Y',
    createdAt: ISODate('2024-12-20T00:00:00.000Z')
  }
)
```
What's happen into the browsers ?

Query the collection
```mongodb
// SELECT * FROM tasks
db.tasks.find()

db.tasks.find( { "text": "Tenth" } )

db.tasks.find( { "text": "Tenth task" } )

// SELECT * FROM tasks  WHERE text = 'Tenth Task'
db.tasks.find( { "text": "Tenth Task" } )

// SELECT * FROM tasks  WHERE text LIKE '%ask%'
db.tasks.find( { "text": /.*ask.*/ } )
db.tasks.find( { "text": /ask/ } )

// Case insensitive and case insensitive
db.tasks.find({'text': {'$regex': '.*task.*'}})
db.tasks.find({'text': {'$regex': '.*task.*', '$options' : 'i'}})

// SELECT * FROM users WHERE username LIKE '%mete%'
db.users.find({username: /mete/})
```

Aggregation
```mongodb
db.tasks.countDocuments({'text': {'$regex': '.*task.*', '$options' : 'i'}})
db.tasks.estimatedDocumentCount({'text': {'$regex': '.*task.*', '$options' : 'i'}})
```

Update / Upsert
```mongodb
db.tasks.updateOne(
   { text: "Tenth Task" },
   { $inc: { priority: 1 } },
   { upsert: true }
)
db.tasks.find( { "text": "Tenth Task" } )
db.tasks.updateMany(
   { text: "Tenth Task" },
   { $inc: { priority: 1 } },
   { upsert: true }
)
db.tasks.find( { "text": "Tenth Task" } )
db.tasks.updateMany(
   { text: /ask/ },
   { $inc: { priority: 1 } },
   { upsert: true }
)
db.tasks.find()

// TODO db.collection.replaceOne(filter, replacement, options)
// https://www.mongodb.com/docs/manual/reference/method/db.collection.replaceOne/#mongodb-method-db.collection.replaceOnes
```

## Deploy with Docker Compose

When developing your application, Meteor starts a local MongoDB instance and automatically connects to it. In production, you must specify a MONGO_URL environment variable pointing at your database https://docs.meteor.com/api/collections.html#mongo_url

* https://github.com/disney/meteor-base/tree/main/example
* https://hub.docker.com/r/geoffreybooth/meteor-base

## More examples

* https://github.com/meteor/examples
* https://github.com/meteor/examples/tree/main/nft-marketplace
* https://github.com/meteor/leaderboard

## Need help ?

* https://university.meteor.com/
* https://www.oreilly.com/library/view/build-applications-with/9781787129887/