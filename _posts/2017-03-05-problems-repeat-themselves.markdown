---
title:  "Problems Repeat Themselves"
date:   "2017-03-05"
categories: [code]
tags: [documentation]
---

Document Solution or you will have to solve it again.  
<!--more-->

Dear Future Self,

You got this message again?

![ErrorLog][1]


Yes, you have see it before.

Here's steps to debug:

Check that the PID isn't still running and kill -9 it if running
          * ps auxwww | grep postgres   - no processes running
          
          * pg_ctl -D /usr/local/var/postgres status   - Checks the status of the server
          
          * kill -9 *PID NUMBER*
          
Didn't work? Postgres's setup and/or configuration could be corrupted so brew will remove the old setup, overwrite any corrupted files or paths, and then install postgres, link it, and start the service.
Try brew

    1. brew uninstall postgres
    2. brew install postgres
    3. brew postinstall postgresql
    4.  brew doctor
    5.  brew link postgresql or brew link --overwrite postgresql
    6. brew services start postgresql
    7 Update if other errors or solutions are found or else you will pay with time a frustration.

Never worry, you have solved this problem at least twice without having this note, you can always solve it again.      

Best of luck,

Past Self

[1]: /img/site/connection_error.png

