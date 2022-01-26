const showButton = () => {
    let elem = document.getElementById('preview_image')
    if(elem == null || ($('#file_field').get(0).files.length === 0 && elem.attributes.length === 2)){
        $('#delete_button').hide();
    }
    else {
        $('#delete_button').show();
    }
}

window.$('#file_field').change(() => showButton())

window.$('#delete_button').click(() => {
    $('#file_field').val('')
    $('#product_delete_image_flag').val(true)
    let elem = document.getElementById('preview_image')
    elem.removeAttribute('src');
    showButton()
})

showButton()