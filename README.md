<h1>Api Key Registerings Applikations Mocka</h1>
<h3>Hur man använder den:</h3>
<h4>if Cloud9:</h4>
```bash
1: git clone https://github.com/nj222dt/1dv450_nj222dt.git
Note: cd Api_regi
2: bundle install
3: rake db:setup 
4: rails server -b $IP -p $PORT
```  
<h4>else</h4>
```bash
1: git clone https://github.com/nj222dt/1dv450_nj222dt.git
Note: cd Api_regi
2: bundle install
3: rake db:setup 
4: rails s
``` 
<h4>Test-värden</h4>
<em>finns i seeds filen annars</em><br>
<strong>User1</strong>
<p>email: User1@example.com</p>
<p>password: user1password</p>
<strong>User2</strong>
<p>email: User2@example.com</p>
<p>password: user2password</p>

<strong>admin</strong>
<p>email: admin@admin.com</p>
<p>password adminpassword</p>
-----------------------------------------------------

<h1>Api</h1>

<h3>POSTMAN-FILES</h3>
[Get the postman files](https://www.getpostman.com/collections/c8b14231ed9673d126f7)
<br>
<strong>How to use</strong>
```bash
1: Do the steps above and log in to Api-client

2: Make a note of a Api-Key that you want to use

3: Use the Knock JWT Token Key - Postman file 
   {"auth": {"email": "example@example.com", "password": "examplepassword"}} Change this
   To the email and password you use to log in to the Api-Client
   Now you will get a JWT token, you need to make a note of that.
   
4: Pick any of the postman-files you want to use and change the headers
    Authorization : Needs the JWT Token Note: Bearer needs to be before the token (1 whitespace)
    Api-key : Needs the Api-key you retrived from the Api-Key in step 2:
    
```
<h1>It's IMPORTANT that you keep the current Token that you got from JWT in Authorization Header and
the Api-key you get from the client-side in Api-key Header</h1>
<br>
<strong>Notes about Postman Files</strong>
<p>If you are gone use the get files to POST make sure you follow the correct JSON</p>

```bash
    To create a School in the (Add School) Postman-file
    {
        "schools":{
            "name":"Example Name",
            "description":"Example Description",
            "tags":[
            {
                "name":"Example Name"
            },
            {
                "name":"Example Name"
            }
            ],
            "position":{
                "address":"Långviksvägen 20, Kalmar"
            }
        }
    }
    Note: Position address is very case sensitive
```

```bash
    To update a school in the (Update School) Postman-file
    {
        "schools":{
            "name":"Example Name",
            "description":"Example Description",
        }
    }
    note: You could use the same JSON as above but tags and position will be ignored
``` 

```bash
    To create a Tag to a school in the (Add Tags by School id) Postman-file
    {
        "tag":{
            "name":"Example Name"
        }
    }
``` 
-----------------------------------------------------------------

<h1>Custom Search<h2>

<h3>Search for school by name</h3>
```bash
    Note: if whitespace use %20, all information is also in (Search School By Name) Postman Files
    /api/v1/schools?search_name=Lars%20kagg (example)
    
    Very Case Sensative
```
<h3>Search for School around location</h3>
```bash
    Note: all information is also in (Search Schools By location) Postman Files 5km radius
    /api/v1/schools?search_location=Långviksvägen 23, Kalmar
```
