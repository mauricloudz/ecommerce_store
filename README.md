# Bootcamp challenge: Polymorphism & Payment methods (Desafio Latam)

Based on a challenge, part of my studies on Desafio Latam academy.

### Challenge: Payment Methods (Polymorphism)

In order to make this works, you'll need:

* RVM & Ruby version: [2.7.0](https://rvm.io/)
* Rails version: [5.2.6](https://guides.rubyonrails.org/v5.2/)

## How it works?

This project does not have any user interface, and only represents how polymorphism relations were made for the given situation:

### The Issue

* We need to implement a non-static product catalog, Each product must be categorized by 2 sub-categories: "Digital" and "Physical".
* Register the payments. Each payment is done using different platforms: Stripe, Paypal and Transbank. If you pay with Transbank, you have another 3 sub-payment methods: Credit Card, Webpay and OneClick.

### The Solution

1. First I do is create the project using Rubyonrails 5.2.6.
--* `rails new ecommerce_store`

2. For the products catalog, I will create the 2 models "Digital" and "Physical", and a third model called Product, which will have the polymorphic relation.
--* `rails g model Digital name`
--* `rails g model Physical name`
--* `rails g model Product name stock:integer category:references{polymorphic}`

Now, we will check if Product was made correctly checking 'app/db/schema.rb' and add the relations between models: `belongs_to :category, polymorphic: true` on the Product model, and `has_many :products, as: :category` on the Digital and Physical models.

3. I need to understand how I gonna make the relations between models, so I first take the Transbank one that has 3 subtypes, and from that working to the ones that have the same level of Transbank. Let's start with the first models and its names.
--* `rails g model CreditCard name`
--* `rails g model WebPay name`
--* `rails g model OneClick name`

And finally the last model with the polymorphic relation. I will add an "amount" field just in case.
--* `rails g model Transbank name ammount:string payment_method:references{polymorphic}`
 
 4. Now, we add the relations between models, so I first take the Transbank one and see if the polymorphic relation is OK. In this case must show: `belongs_to :payment_method, polymorphic: true`. If this is good, I add `has_many :transbanks, as: :payment_method` to the other 3 models. That completes their relations.

 5. Now, I need to create the models that are on the same level of Transbank. Let's make them.
 --* `rails g model Stripe name`
 --* `rails g model PayPal name`

 6. With the models created, I need to link them in a model with a polymorphic relation. 
 --* `rails g model Payment name payable:references{polymorphic}`

In this case, **payable** will be the relation.

7. I am almost done, only need to check if the polymorphic relation on Payment is ok. If it is ok, we add `has_many :payments, as: :payable` on Stripe, PayPal and Transbank models.

8. And finally, create the model that will enclose the entire payment order and the relation. I will call it "Order".
--* `rails g model Order order_number:integer`

And then add `has_many :payments` on the Order model.

That's all. We finished the challenge. Now all the relations are completed.
