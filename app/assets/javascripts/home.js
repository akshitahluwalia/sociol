$(function () {
    $('#photo_button').click(function (e) {
            e.preventDefault();
            $('#new_post_file_field').click();
        }
    );
    $("#new_post_file_field").change(function () {
        readURL(this);
    });
});
console.log("LOADED")

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            console.log("LOADED")
            console.log(e)
            $('#new_post_thumb').attr('src', e.target.result);
            $('#new_post_thumb').removeClass('hidden')
        }
        reader.readAsDataURL(input.files[0]);
    }
}
