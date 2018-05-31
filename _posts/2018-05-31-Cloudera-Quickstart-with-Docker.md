---
title:  "Cloudera/Quickstart with Docker"
date:   "2018-05-31`"
categories: [code, docker, cloudera, hadoop]
tags: [code, docker, cloudera, hadoop]
---

Yes, it is so frustrating to pull down example code and it has a error on startup.  

After installing Docker Community edition for Mac and pulling the Cloudera/Quickstart image, I tryied to run it with 'docker run --hostname=quickstart.cloudera --privileged=true  -t -i -p 7180:7180 -p 8888:8888 cloudera/quickstart /usr/bin/docker-quickstart'.

No Bueno

I saw an error about my configuration (which I had not touched):

Configuration files located in /etc/hue/conf.empty

Potential misconfiguration detected. Fix and restart Hue.

Not the desired result.  

The solution was to go into my Docker preferences and increasing the memory amount.  Hadoop needed more space but was not telling me of it's needs. 

More space - why is communication so hard?
