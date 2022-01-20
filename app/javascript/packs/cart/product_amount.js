window.update_quantity = (id, quantity) => {
    $.ajax({
        type: 'POST',
        url: `/cart/update_cart/${id}`,
        data: { quantity: quantity }
    })
}

window.incrementValue = (e) => {
    e.preventDefault()
    const fieldName = $(e.target).data('field')
    const parent = $(e.target).closest('div')
    let currentVal = parseInt(parent.find('input[name=' + fieldName + ']').val(), 10)
    if (!isNaN(currentVal)) {
        currentVal += 1
    } else {
        currentVal = 1
    }
    parent.find('input[name=' + fieldName + ']').val(currentVal)

    update_quantity(parent[0].id.substr(6), currentVal)
}

window.decrementValue = (e) => {
    e.preventDefault();
    const fieldName = $(e.target).data('field');
    const parent = $(e.target).closest('div');
    let currentVal = parseInt(parent.find('input[name=' + fieldName + ']').val(), 10);

    if (!isNaN(currentVal) && currentVal > 1) {
        currentVal -= 1
    } else {
        currentVal = 1
    }
    parent.find('input[name=' + fieldName + ']').val(currentVal)

    update_quantity(parent[0].id.substr(6), currentVal)
}

window.changeValue = (e) => {
    e.preventDefault();
    const field = e.target;
    let currentVal = parseInt(`${field.value}`, 10);

    if (isNaN(currentVal) || currentVal < 1) {
        currentVal = 1
    } else if (currentVal > 99) {
        currentVal = 99
    }
    field.value = currentVal

    update_quantity(field.id.substr(7), currentVal)
}

window.$('.input-group').on('change', '.quantity-field', (e) => {
    changeValue(e)
})

window.$('.input-group').on('click', '.button-plus', (e) => {
    incrementValue(e)
})

window.$('.input-group').on('click', '.button-minus', (e) => {
    decrementValue(e)
})