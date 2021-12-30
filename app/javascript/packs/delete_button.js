let showButton = () => {
    let elem = document.getElementById('preview_image')
    if(elem == null || ($('#file_field').get(0).files.length === 0 && elem.attributes.length === 2)){
        $('#delete_button').hide();
    }
    else {
        $('#delete_button').show();
    }
}

$('#file_field').change(() => showButton())

$('#delete_button').click(() => {
    $('#file_field').val('')
    let elem = document.getElementById('preview_image')
    elem.removeAttribute('src');
    showButton()
})

showButton()