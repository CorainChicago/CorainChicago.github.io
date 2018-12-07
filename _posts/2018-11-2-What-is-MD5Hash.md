What is an MD5Hash?


Here's how to create one in Java:

// Static getInstance method is called with hashing MD5 
        MessageDigest md = null;
		md = MessageDigest.getInstance("MD5");
		
		// digest() method is called to calculate message digest 
        //  of an input digest() return array of byte 
        byte[] messageDigest = md.digest(input.getBytes()); 

        // Convert byte array into signum representation 
        BigInteger no = new BigInteger(1, messageDigest); 

        // Convert message digest into hex value 
        return no.toString(16); 
