---
title:  "Jar File will Not Run For Me"
date:   "2018-05-17"
categories: [code, java]
tags: [code, java]
---

The jar file won't run for me... but it runs for everyone else. 

<!--more-->

I made an update to a Java projec that ran as a cron job.  It worked beautifully in my IDE, so I pushed the code, got it merged and deployed, scheduled the cron job, and then set some test data for it.  Coming back in the next day, the cron job had not effected my test
data, which was disappointing. 

What became frustrating was how others could run the jar file and I couldn't.  They built it in the target folder, with 'mvn clean install', or downloaded the deployed version and ran it.  I kept having to go to others to debug as I couldn't do it myself. 

ARG!!!!!  NOTHING IS AS FRUSTRATING AS NOT BEING ABLE TO DEBUG YOUR CODE YOUR SELF.

The issue was the java project was built with Java 8, and my laptop was on Java 9.  While the men of Oracle say it's backwards compatable, don't trust them.  I had been to a talk by an Oracle dude and he touted that it's always backwards compatable... but there's always a caveat to that statement.   

I fixed the problem by downloading Java 8 and running `export JAVA_HOME=`/usr/libexec/java_home -v 1.8`` to set it as the version used.  

If a jar file won't run on one laptop but it will on the other, check the Java version. 




