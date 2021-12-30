let button = () => {
    let elem = document.getElementById('your_preview_id')
    if(elem == null || ($('#input').get(0).files.length === 0 && elem.attributes.length === 1)){
        $('#button').hide();
    }
    else {
        $('#button').show();
    }
}

$('#input').change(() => button())

$('#button').click(() => {
    $('#input').val('')
    let elem = document.getElementById('your_preview_id')
    while(elem.attributes.length > 1)
        elem.removeAttribute(elem.attributes[1].name);
    button()
})

button()
