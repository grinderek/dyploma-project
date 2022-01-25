// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap'
import "@fortawesome/fontawesome-free/css/all.css";
import "../stylesheets/aplication.scss"

Rails.start()
ActiveStorage.start()
window.jQuery = window.$ = jQuery;

$(document).ready(() => {
    require('products/show_image')
    require('products/delete_image_button')
    require('products/list_of_products')
    require('orders/delivery_method')
    require('cart/product_amount')
    require('cart/remove_from_cart')
})
