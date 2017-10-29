---
title:  "Maven Commands"
date:   "2017-04-12"
categories: [code]
tags: [maven, java, spring]
---

Maven commands to get a project up and running.  
<!--more-->

My projects using Maven are microservices and glee jolly, it's fun to get them up and running locally whne I often need to switch branches and rebuild the project for a bug ticket that's in a pre-production environment.  

Here are some of the commands I use after switching branches or pulling down a new microservice and do a 'Maven reimport'.  
  
    -'mvn clean': it should clean, cause it says clean
    -'mvn install': installs, but I rarely run it
    -'mvn -U compile': ...maybe this mean universally compiles the code to work


So what does these mysterious commands mean and what do they do?

'mvn clean':  In a built project  (like a Java microservce), there is a 'target' file. The 'clean' command takes the target file and deletes the files in it.  Fresh start!!!  Whoot, hoot!  

This means when the project is compiled again and run again, you won't have any old code going out with the new (that would be bad).

I learned this from http://www.mkyong.com/maven/how-to-clean-project-with-maven/. 


'mvn install': It looks at the 'pom.xml' file, figures out what depends on what, pulls down any dependencies needed (think about all of those import lines at the top of a java file), and then:

1. process-resources
2. compile
3. process-test-resources
4. test-compile
5. test
6. package
7. install
8. deploy

If the project has failing tests (bad sign, but I forgive you), to skip the tests run it as 'mvn install -DskipTests=true'.  

Stackoverflow had a great answer to this: http://stackoverflow.com/questions/10533828/what-does-mvn-install-in-maven-exactly-do

'mvn -U compile': Well... what does the 'compile' and '-U' do?  (hint, it will yell if you try '-u')

'compile'











