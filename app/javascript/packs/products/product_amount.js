update_quantity = async (id) => {
    await fetch(window.location.origin + `/admin/products?id[]=${inputs}`, {
        method: "DELETE"
    })
}

incrementValue = (e) => {
    e.preventDefault();
    const fieldName = $(e.target).data('field');
    const parent = $(e.target).closest('div');
    const currentVal = parseInt(parent.find('input[name=' + fieldName + ']').val(), 10);
    console.log(parent[0].id)
    if (!isNaN(currentVal)) {
        parent.find('input[name=' + fieldName + ']').val(currentVal + 1);
    } else {
        parent.find('input[name=' + fieldName + ']').val(1);
    }

    func(parent[0].id.substr(6))
}

decrementValue = (e) => {
    e.preventDefault();
    const fieldName = $(e.target).data('field');
    const parent = $(e.target).closest('div');
    const currentVal = parseInt(parent.find('input[name=' + fieldName + ']').val(), 10);

    if (!isNaN(currentVal) && currentVal > 1) {
        parent.find('input[name=' + fieldName + ']').val(currentVal - 1);
    } else {
        parent.find('input[name=' + fieldName + ']').val(1);
    }
}

window.$('.input-group').on('click', '.button-plus', (e) => {
    incrementValue(e);
});

window.$('.input-group').on('click', '.button-minus', (e) => {
    decrementValue(e);
});