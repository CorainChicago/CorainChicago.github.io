---
title:  "MongoOperations: Unset Many in Array"
date:   "2018-04-27"
categories: [mongo, database]
tags: [mongo]
---

If you need to 'unset' a field in an object for many objects in an array, use this to loop:

`while (mongoOperations.updateMulti(query, update, CollectionName.class.is).UpdateOfExisting());`

It will loop through all the objects in the array and apply the unset update to the field specified. 
