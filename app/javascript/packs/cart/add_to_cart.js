window.add_to_cart = id => {
    scroll(0, 0)
    $.ajax({
        type: 'POST',
        url: `/cart/add_to_cart/${id}`
    })
}