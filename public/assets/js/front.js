
$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});

$(document).ready(function () {

    $(document).on('submit', '#form-search', function (e) {

        e.preventDefault();

        let form = $('#form-search');
        let formData = new FormData(form[0]);

        if (form[0].checkValidity()) {

            $.ajax({
                url: "/ajax/store-user",
                type: 'POST',
                data: formData,
                dataType: 'json',
                processData: false,
                contentType: false,

                success: function (res) {
                    
                    if(res.success){
                        alert(res.message);

                    }
                    else{
                        alert(res.message);
                    }
                },

                error: function (xhr) {
                }

            });

        } else {
            form[0].reportValidity();
        }

    });

});