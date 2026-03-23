$(function () {

    let page = $('#page-rdv');

    if(page.length ===0 ) return false;

    $(document).ready(function () {

        tableEvent = initDatatable('#table-event', [
            { title : 'Demandeur', data : 'demandeur', name : 'demandeur', orderable : true, searchable : true },
            { title : 'Demande', data : 'demande', name : 'demande', orderable : true, searchable : true },
            { title : 'Événement', data : 'event_nom', name : 'event_nom', orderable : true, searchable : true },
            { title : 'Date', data : 'event_date', name : 'event_date', orderable : true, searchable : true },
            { title : 'Heure', data : 'heure', name : 'heure', orderable : true, searchable : true },
            { title : 'Message', data : 'message', name : 'message', orderable: false, searchable: true },
            { title : 'Status', data : 'status', name : 'status', orderable : false, searchable : false },
            { title: 'Action', data: 'actions', orderable: false, searchable: false },
        ], {
            ajax : '/ajax/page-event',
            order : [[3, 'desc']],
        }, undefined);


    })
    .on('click','.annuler-rdv', function () {
        
        const rdvId = $(this).data('id');

        modalAjax('/ajax/rdv-cancel-form/' + rdvId, {
                    title: 'Motif d\'annulation',
                    ok: 'Enregistrer',
                    cancel: 'Fermer',
                    onOk: function (modal, loader, success, fail) {
                        const form = $('#form_cancel_rdv');
                        if (!form[0].checkValidity()) { form[0].reportValidity(); return; }

                        const data = form.serializeArray();
                        data.push({ name: 'status', value: 'annulé' });

                        $.ajax({
                            url: '/ajax/rdv-change-status',
                            method: 'POST',
                            data: data,
                            dataType: 'json',
                            success: function (res) {
                                if (res.success) {
                                    Toast.fire({ icon: 'success', title: res.message });
                                    modal.modal('hide');
                                    tableEvent.ajax.reload();
                                } else {
                                    Toast.fire({ icon: 'error', title: res.message || 'Erreur' });
                                }
                            },
                            error: function () {
                                Toast.fire({ icon: 'error', title: 'Erreur serveur' });
                            }
                        });
                    }
                });

    })
    .on('click','.confirmer-rdv', function () {
        const rdvId = $(this).data('id');

        Swal.fire({
                    title: 'Confirmer le rendez-vous',
                    text: 'Êtes-vous sûr de confirmer ce RDV ?',
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#28a745',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Oui, confirmer',
                    cancelButtonText: 'Annuler'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.post('/ajax/rdv-change-status', { id_rdv: rdvId, status: 'confirmé' }, function (res) {
                            if (res.success) {
                                Toast.fire({ icon: 'success', title: res.message });
                                tableEvent.ajax.reload();
                            } else {
                                Toast.fire({ icon: 'error', title: res.message || 'Erreur' });
                            }
                        }, 'json');
                    }
                });

    })
});