window.remove_from_cart = (id) => {
    $.ajax({
        type: 'DELETE',
        url: `/cart/remove_from_cart/${id}`
    })
}

