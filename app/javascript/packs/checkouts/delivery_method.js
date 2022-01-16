window.checkDefault = () => {
    const elem = document.querySelector('input[checked="checked"]')
    if (!elem) return

    elem.checked = true
    if (elem.id === 'checkout_delivery_self-pickup') {
        $("#address_section").css('display', 'none')
        $("#address_field").val('Address of your company')
    }
}

window.$('input:radio[name="checkout[delivery]"]').change(
    function() {
        if ($(this).attr('id') === 'checkout_delivery_delivery_address') {
            $("#address_section").css('display', 'block')
            $("#address_field").val('')
        } else {
            $("#address_section").css('display', 'none')
            $("#address_field").val('Address of your company')
        }
    }
)

checkDefault()