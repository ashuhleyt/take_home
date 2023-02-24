## Getting Started

##### Required
- Rails 5.2.8.1
- Ruby 2.7.4
<br>
Clone this repository to your local machine.
In the root directory, run the following commands: <br>

``` bundle install ``` <br>

``` rails db:{drop,create,migrate,seed} ```


### Schema Design

![Tea](https://user-images.githubusercontent.com/105073232/221037128-0c7776b8-ec32-4384-9b80-fcdf87af89b4.jpg)

<br>
<br>

### Create A New Customer Subscription
POST api/v1/customers/1/subscriptions
<br>
``` {
    "data": {
        "id": 5,
        "price": 4.0,
        "status": "active",
        "frequency": 30,
        "title": "Big Homies",
        "tea": {
            "title": "Blaise Zabini",
            "description": "Just because you have the emotional range of a teaspoon doesn’t mean we all have.",
            "temperature": 98,
            "brew_time": 146
        }
    }
}
```




### Cancel A Subscription
PATCH /api/v1/subscriptions/1?status=cancelled
<br>
``` {
    "data": {
        "success": "Your subscriptions have been updated!"
    }
}
```

### All Customer Subscriptions Avtive And Cancelled
GET /api/v1/customers/1/subscriptions
<br>
``` {
    "data": {
        "subscriptions": [
            {
                "id": 1,
                "price": 371.0,
                "status": "cancelled",
                "frequency": 30,
                "title": "Peter Pettigrew",
                "tea": {
                    "title": "Peter Pettigrew",
                    "description": "It takes a great deal of bravery to stand up to our enemies, but just as much to stand up to our friends.",
                    "temperature": 99,
                    "brew_time": 177
                }
            },
            {
                "id": 3,
                "price": 252.0,
                "status": "active",
                "frequency": 14,
                "title": "Winky",
                "tea": {
                    "title": "Cho Chang",
                    "description": "We could all have been killed - or worse, expelled.",
                    "temperature": 95,
                    "brew_time": 167
                }
            },
            {
                "id": 5,
                "price": 4.0,
                "status": "active",
                "frequency": 30,
                "title": "Big Homies",
                "tea": {
                    "title": "Blaise Zabini",
                    "description": "Just because you have the emotional range of a teaspoon doesn’t mean we all have.",
                    "temperature": 98,
                    "brew_time": 146
                }
            }
        ]
    }
}
```
<br>

### Tech
![rubyonrails](https://img.shields.io/badge/Ruby-100000?style=for-the-badge&logo=rubyonrails&logoColor=cc0000&labelColor=000000&color=000000)
<br>
![ruby](https://img.shields.io/badge/Ruby-100000?style=for-the-badge&logo=Ruby&logoColor=cc0000&labelColor=000000&color=000000)
