window.checkDefault = () => {
    const elem = document.querySelector('input[checked="checked"]')
    if (!elem) return

    elem.checked = true
    if (elem.id === 'order_delivery_method_self-pickup') {
        $("#address_section").css('display', 'none')
        $("#address_field").val('Address of your company')
    }
}

window.$('input:radio[name="order[delivery_method]"]').change(
    function() {
        if ($(this).attr('id') === 'order_delivery_method_delivery_address') {
            $("#address_section").css('display', 'block')
            $("#address_field").val('')
        } else {
            $("#address_section").css('display', 'none')
            $("#address_field").val('Address of your company')
        }
    }
)

checkDefault()