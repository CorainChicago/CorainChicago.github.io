---
title:  "Error in the Maven Install"
date:   "2018-09-14"
categories: [code]
tags: [spring]
---

This error occurred when I was running 'mvn clean build' and getting the error below:

[ERROR] Source option 5 is no longer supported. Use 6 or later.
[ERROR] Target option 1.5 is no longer supported. Use 1.6 or later.




forces the version in build
  <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.0</version>
                <configuration>
                    <source>10</source>
                    <target>10</target>
                </configuration>
            </plugin>

        </plugins>
    </build>
    
Better solution is to go into Eclipse and check the build path
