---
title:  "Rails + Carrierwave + Fog + Amazon s3"
date:   "2016-07-12"
categories: [code]
tags: [rails]
---

Putting these things all together
<!--more-->
Normally, I use Carrierwave + Cloudinary to upload, store and retrieve photos in Rails applications. RailsBridge Chicago has a great set of instructions on how to set this up. I wanted to start using Amazon Web Services more so I decided to convert my photo upload to an S3 bucket.

After a bit of frustration, reading through documentation and stackoverflow answers, and creating then deleting buckets and user keys, I got it to work.

Here's the steps from the front to back of a Rails app.

Add the upload to the form for the object in the view

```ruby        
          <%= f.label :image %>
          <%= f.file_field :image %>
```        
      
Install Gems

Gemfile

```bash        
  # For photo upload
  gem 'carrierwave','0.10.0'
  # Connects to the S3 account
  gem 'fog'
  # Library for image manipulation
  gem "mini_magick"
```        
      
Remember to run bundle install or your terminal will yell at you.

Install Carrierwave and create uploader (use the Carrierwave docs - they are great for this).

Run rails generate uploader Image to create the image uploader (or name it Photos or anything else you like.

Add the uploader to the object needing the image. For example: 
rails g migration add_image_to_dogs image:string 
adds the image field to the dogs table.

Mount the uploader in the Model for the table. For example in models/dogs.rb:

```ruby           
  class Dog < ActiveRecord::Base
    mount_uploader :image, ImageUploader
  end
```          
        
Uploader File

When you ran the command rails g uploader Image, a folder and file was created in your application. Look at app/uploaders/image_uploader.rb. Notice all the commented out code and read through what it does (rather handy and remember to be appreciative of all the open source contributors and maintainers who make gems like this).

Here are the minimum lines to uncomment:

include CarrierWave::MiniMagick - This pulls in the MiniMagick library to make photo manipulation a breeze.

```ruby   
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
```          
        
This gives Carrierwave a name convention and location for uploaded photos

storage :file - This tells Carrierwave where to store the photos. You can try out your setup with the storage :file uncommented to make sure Carrierwave and the form are working correctly. Once you are sure the photos are uploading (check your public/uploads/ folder to see the uploaded photos), comment out the line and uncommnent storage :fog

Setup Amazon Web Services

You will need an Amazon Web Services (AWS) account with an S3 bucket and User. The User will have a Access Key Id,Secret Access Key and the S3 bucket will have a name (you create it) and region (I use "US Standard"). This is not the fun part but it's easier after you have it done once.

There's a whole process to sign up for AWS and your credit card will be involved. You won't be charged at first since there's a free tier, but if you use enough storage or services, they will start to charge you. This is a big reason to keep your key id and secret safe.

This is my go-to blog post about hiding keys and secrets in a rails app "Rails Environment Variables. I use the local_env.yml file method.

Create your configuation file

This is where I ended up searching through stackoverflow again and again. Here's the setup that worked for me:

```javascript

    config/initializers/s3.rb
    
      CarrierWave.configure do |config|
        config.fog_credentials = {
            :provider               => 'AWS',
            :aws_access_key_id      => ENV['S3_KEY'],
            :aws_secret_access_key  => ENV['S3_SECRET'],
            :region                 => 'us-east-1'
        }
        config.fog_directory  = ENV['S3_BUCKET_NAME']
      end
```          
        
Once I got the application storing files locally, settting up the S3 bucket storage meant reading error messages in my console, reviewing configuations for files and fog gems, and checking on my AWS bucket and account setup.

Remember: It's only hard to do the first time, read the error messages, and HIDE you AWS key and secret!