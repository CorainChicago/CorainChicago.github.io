---
title:  "Getting Over the Open Source Jitters"
date:   "2015-12-29"
categories: [code]
tags: [opensource]
---

Driving back to Chicago from Christmas in Michigan, I pulled out my phone to review an open source project a contact sent me. My Christmas included less coding than ideal and more food than ideal, resulting in me itching to either workout or code. Since I was in the passenger seat of the car, code was the only option. I looked up the project’s Github and started reading the documentation on the tiny screen of my phone.

There were so many words I didn't know. Scanning through the first Readme, I was lost about what the code did beyond handle JSON generation. What are these words? No, I knew most of the words just one word was unclear "ActiveModelSerializers". I knew ActiveRecord, Models, and had called the method ".serialize()" in AJAX. So what did all the words mean when they came together?

Clicking through the docs, I saw a link to more information on serializers. Yes! The answer to the question "What does this code do" is just behind this link. I should know more about serializers to know what the ActiveModelSerializer does and then I can start to see how I can contribute to the project.

Unfortunately, the link didn't work.

Closed the phone, thought terribly negative things about myself for not being able to understand the Readme, realized I was in Indiana (the halfway point), opened the phone again, and then I tried to inspect the page to see the code for the link (my phone doesn't support this and I don't think anyones does). I sat annoyed with not being able to even understand the docs and the broken link. Finally, I realized I could fix this at home.

Why of course! I'll just fix this link and then figure out the rest of the code.

This is how I finally got into open source.

So let's demystify contributing to open source projects for newbies:

Read the Contributing instructions and review the closed pull requests. This informs you of the project's process for pull requests, any tidbits of etiquette (like including 'ci --skip' when updating documentation so the ci won't run all of the tests)
Create a branch for your contribution
Make the change/fix to the code
Add and commit your code in git
Push your branch with the changes
Then make a pull request from your fork to the project's master branch
Add a message to the pull request
Be happy
Back when first learning to code, I learned about open source. I knew it existed and that finding a project to contribute to was good. At the same time, my coding skills were low, my confidence in my ability low and I was learning about the negative side of open source and coding: sexism and trolls.

It was similar to being told, "Go ahead, jump off the high dive" and "Be careful of the alligators. They like the water here.” paired with the anxiety of submitting an application and fear of being rejected.

Later on, I tried delving into open source again after learning more about coding and gaining more confidence, this time the volume of projects consumed my time. So how did I finally get to submitting a pull request?

First, I became comfortable submitting pull requests to projects I didn't own. This came by way of me creeping on classmate's blog sites, adding margins, line heights and fixing spelling. The first time I submitted a pull request to a classmate’s repository, I was at work (a non-tech job), almost hid under my desk and then sent a message to the classmate apologizing for creeping on their code. Yes, I hid and apologized for suggesting a way to make their site look better. After the first pull request, the second was easier and so was the third.

So back to the broken link.

I forked the repository, cloned it to my desktop, made a branch, fixed the link, checked the link, commited, pushed the branch up, made the pull request, and then happily waited. I could be confident in a few things at the time I submitted the pull request, but the main one was that I knew people would be kind to me. I had a coffee scheduled with a maintainer and had met him previously. He seemed cool, like funny blog posts about tech cool.

We had a positive exchange to get the pull request merged. First, they thanked me. Being appreciated for my efforts, while just 2-4 words that it took, shaped the rest of the exchanges with a nice tone in my head. Next, they asked me to switched the fix from a hypertext link to a relative path (from "https://.." to "/path/to/document"). This matched the format of their other links within the documentation. Finally, they encouraged me to rebase and squash my commits. I had two commits to fix a link, a small number of commits and also a small change, which I took as an ideal setup to try out new git commands without messing up my code.

Now I need to build an API in a Rails app to implement the ActiveModelSerializer.