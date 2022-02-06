# Online shop

##### User options

- View products and add them to cart
- Change product quantity on cart page
- Make orders and apply promo codes

##### Admin options

- Create, view, edit, delete products
- Create promo codes
- View user orders

##### Notes
1. The deletion of products is implemented in the project not by a complete deletion from the database, but by adding the boolean field "deleted" to the products. This is done to have information about each product in the already made orders
2. If admin changes price of products price of these products in the already made orders won't change 
3. If admin marked product as deleted and this product is in some user's cart - after refreshing the page or going to another page this product will disappear from the cart. Here's the problem: when the user is on the checkout page, admin deletes product that's in the user cart and the user confirms the order - the order will be placed and the user will not know about the missing products, also there is a chance that an empty order will be created. In the near future this will be fixed with WebSockets, I guess:)
## Deployed project
The project was deployed on the Heroku. There are two URLs for different roles in this project: [User](https://dyploma-project.herokuapp.com/) and [Admin](https://dyploma-project.herokuapp.com/admin)

## Run on local machine
##### 1. Prerequisites

The setups steps expect following tools installed on the system.

- Git
- Ruby 3.0.2
- Rails 6.1.4
- Node >= 16
- Yarn >= 1.22.17

##### 2. Clone the repository

```bash
git clone https://github.com/grinderek/dyploma-project.git
cd dyploma-project
```

##### 3. Install dependencies

```bash
bundle install
yarn install
```

##### 4. Initialize the database

```bash
rails db:create db:migrate db:seed
```

##### 5. Start the server

```bash
rails s
```

Now you can use this project on your local machine: for [User](http://localhost:3000/) and for [Admin](http://localhost:3000/admin/)

