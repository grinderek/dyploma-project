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

const showImage = input => {
    let elem = document.getElementById('preview_image')
    if (elem.hasAttribute('src')) elem.removeAttribute('src');

    if (input.files && input.files[0] && isImage(input.files[0].name)) {
        $('#product_delete_image_flag').val(false)
        let reader = new FileReader();

        reader.onload = e => $('#preview_image')
            .attr('src', e.target.result)

        reader.readAsDataURL(input.files[0]);
    }
}

window.$('#file_field').change(function () {
    showImage(this)
})
