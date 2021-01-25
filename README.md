# AUCTIONS-API

### Test Api with httpie  

* Signup  
http :3000/signup name=steve email=steve@email.com password=foobar password_confirmation=foobar    
=>  "auth_token": "token"  

* Login  
http :3000/auth/login email=steve@email.com password=foobar  
=>  "auth_token": "token"  

* Access url path  
http :3000/<url_path> Authorization:token  

### API URL

### ActiveRecord Note

* Add Polymorphic Associations
```
    rails g migration AddSubjectToActivities subject:references{polymorphic}

    class Activity < ApplicationRecord
      belongs_to :subject, :polymorphic => true
    end
```

