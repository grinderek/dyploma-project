const showImage = input => {
    let elem = document.getElementById('preview_image')
    if (elem.hasAttribute('src')) elem.removeAttribute('src');

    if (input.files && input.files[0] && isImage(input.files[0].name)) {
        let reader = new FileReader();

        reader.onload = e => $('#preview_image')
            .attr('src', e.target.result)

        reader.readAsDataURL(input.files[0]);
    }
}

$('#file_field').change(function () {showImage(this)})


const getExtension = filename => {
    let parts = filename.split('.');
    return parts[parts.length - 1];
}

const isImage = filename => {
    let ext = getExtension(filename);
    switch (ext.toLowerCase()) {
        case 'jpg':
        case 'jpeg':
        case 'png':
            return true;
    }
    return false;
}