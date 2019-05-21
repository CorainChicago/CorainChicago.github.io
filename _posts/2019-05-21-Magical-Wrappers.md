I had code that worked to listen to the Sqs and save the data as an object.  I mapped the message from the listener into an object and used Jackson's object wrapper to marshall the json into the object.  

When I went to write the test, the json in my test file failed to marshall into the obejct. After trying different versions of the json and it still failing, a teammate suggested that aws /spring added a wrapper around the string that I could not detect and I needed to add "@JsonIgnoreProperties(ignoreUnknown = true)" to the object to make it marshall.

Adding "@JsonIgnoreProperties(ignoreUnknown = true)" worked. 
