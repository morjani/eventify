
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
                       Toast.fire({
                                    icon: "success",
                                    title: res.message
                                });
                        setTimeout(function() {
                            window.location.href = '/login';
                        }, 2000); // Redirect after 2 seconds

                    }
                    else{
                        Toast.fire({
                            icon: "error",
                            title: res.message
                        });
                    }
                },

                error: function (xhr) {
                    console.error(xhr);
                    if (xhr.status == 422) {
                        let errors = xhr.responseJSON.errors;
                        let errorMessage = '';
                        for (let field in errors) {
                            errorMessage += errors[field][0] + '\n';
                        }
                        Toast.fire({
                            icon: "error",
                            title: errorMessage
                        });
                    } else {
                        Toast.fire({
                            icon: "error",
                            title: 'Erreur serveur. Veuillez réessayer.'
                        });
                    }
                }

            });

        } else {
            form[0].reportValidity();
        }

    });

});