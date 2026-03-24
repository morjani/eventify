$(function () {

    let page = $('#page-participant');

    if(page.length ===0 ) return false;

    $(document).ready(function () {

        tableParticipant = initDatatable('#table-participant', [
            {
                title : 'Nom',
                name  : 'last_name',
                data  : 'last_name',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : 'Prenom',
                name  : 'first_name',
                data  : 'first_name',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : 'Pays',
                name  : 'pays',
                data  : 'pays',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : 'Ville',
                name  : 'ville',
                data  : 'ville',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : 'Numéro téléphone',
                name  : 'phone',
                data  : 'phone',
                render: null,
                orderable : true,
                searchable : true,
            },
          
            {
               
                title: "Action",
                data: 'actions',
                render: null,
                orderable: false,
                searchable: false,

            },
        ], {
            ajax    : "/ajax/dt-participants",
            order           : [[1, 'desc']],

        }, undefined);
       

    })
    .on('click','.prendre-rdv',function(){

        let participantId = $(this).data('id');

        modalAjax('/ajax/prendre-rdv/', {

            title           : 'Prendre RDV' ,
            header_close    : true,
            footer_ok       : true,
            footer_cancel   : false,
            very_small      : false,
            size_md         : true,
            size_lg         : false,
            close_outsid    : true,
            ok              : 'Save',
            cancel          : 'Cancel',
            error_msg       : 'error',
            sucess_msg      : 'Data saved successfully!',
            always_close    : false,
            show_header     : true,
            show_footer     : true,
            post_data       : {'participant_id' : participantId},
            onLoad          : function(){
                // Charger les heures disponibles
                $.ajax({
                    url: '/ajax/available-hours/' + participantId,
                    type: 'GET',
                    dataType: 'json',
                    success: function(res) {
                        if (res.success && res.data) {
                            let houreSelect = $('#heure');
                            houreSelect.empty();
                            houreSelect.append('<option value="">Choisir l\'heure</option>');
                            
                            $.each(res.data, function(key, label) {
                                houreSelect.append('<option value="' + key + '">' + label + '</option>');
                            });

                            if (Object.keys(res.data).length === 0) {
                                houreSelect.append('<option value="">Aucune heure disponible</option>');
                                houreSelect.prop('disabled', true);
                            }
                        }
                    },
                    error: function() {
                        console.error('Erreur lors du chargement des heures');
                    }
                });
            },
            onOk            : function (modal, loader, sucess, fail){

                let form = $('#form_prendre_rdv');

                if (form[0].checkValidity()) {
                    $('.modal-footer button')
                        .addClass('loading')
                        .html('<span class="spinner"></span> Inprogress');

                    $.ajax({
                        url: '/ajax/store-rdv',
                        type: 'POST',
                        data: form.serialize() + '&participant_id=' + participantId,
                        dataType: 'json',
                        success: function(res) {
                            if (res.success) {
                                Toast.fire({
                                    icon: "success",
                                    title: res.message
                                });
                                
                                modal.modal('hide');
                               
                            } else {
                                Toast.fire({
                                    icon: "error",
                                    title: res.message
                                });
                            }
                        },
                        error: function(xhr) {
                            console.error(xhr);
                            Toast.fire({
                                icon: "error",
                                title: 'Server error. Please try again.'
                            });
                        },
                        complete: function() {
                            $('.modal-footer button').removeClass('loading').html('Save');
                        }
                    });

                } else {
                    form[0].reportValidity();
                }

            },
            onCancel        : function () {},
            onClose         : function () {}
        });

    })

})