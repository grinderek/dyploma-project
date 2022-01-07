window.uncheck = () => {
    const inputs = document.getElementsByTagName("input")
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].checked = false
    }
}

window.checkOne = (check_one) => {
    const checkbox = document.getElementsByName(check_one)
    checkbox.checked ^= true

    let inputs = [].slice.call(document.getElementsByTagName("input"))
    inputs = inputs.filter(x => (x.type === "checkbox" && x.name !== 'check_all'))
    const check_all = document.getElementsByName('check_all')
    const count_of_all = inputs.length
    const count_of_checked = inputs.filter(x => x.checked === true).length

    if (count_of_checked === count_of_all) {
        check_all[0].checked = true
    } else {
        check_all[0].checked = false
    }
}

window.checkAll = (check_all) => {
    const inputs = document.getElementsByTagName("input")
    for (let i = 0; i < inputs.length; i++) {
        if (inputs[i].type === "checkbox" && inputs[i].name !== check_all.name) {
            if(check_all.checked === true){
                inputs[i].checked = true
            }else{
                inputs[i].checked = false
            }
        }
    }
}

window.$(':checkbox').change(() => {
    let inputs = [].slice.call(document.getElementsByTagName("input"))
    inputs = inputs.filter(x => (x.type === "checkbox" && x.name !== 'check_all'))
    const count_of_checked = inputs.filter(x => x.checked === true).length

    const button = document.getElementById('delete_product')
    if (count_of_checked === 0) {
        button.disabled = true
    } else {
        button.disabled = false
    }
})

window.deleteProducts = async () => {
    let inputs = [].slice.call(document.getElementsByTagName("input"))
    inputs = inputs.filter(x => (x.type === "checkbox" && x.name !== 'check_all'))

    for (let i = 0; i < inputs.length; i++) {
        if (inputs[i].checked === true) {
            const id = inputs[i].name.substr(6)
            console.log(id)
            console.log(window.location.origin)
            await fetch(window.location.origin + `/admin/products/${id}`, {
                method: "DELETE",
            })
        }
    }
    window.location.replace(window.location.origin + `/admin/products`);
}

uncheck()