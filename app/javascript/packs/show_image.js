let showImage = input => {
    if (input.files && input.files[0]) {
        let reader = new FileReader();

        reader.onload = e => $('#your_preview_id')
            .attr('src', e.target.result)
            .width(500)
            .height(200);

        reader.readAsDataURL(input.files[0]);
    }
}

$('#input').change(function () {showImage(this)})