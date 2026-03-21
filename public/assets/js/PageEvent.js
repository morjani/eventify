$(function () {

    let page = $('#page-event');

    if(page.length ===0 ) return false;

    $(document).ready(function () {

        tableEvent = initDatatable('#table-event', [
            {
                title : 'Demandeur',
                data  : 'id_demandeur',
                name  : 'id_demandeur',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : 'Demande',
                data  : 'id_demande',
                name  : 'id_demande',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : 'Date',
                data  : 'date',
                name  : 'date',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : 'Heure',
                name  : 'heure',
                data  : 'heure',
                render: null,
                orderable : true,
                searchable : true,
            },
            {
                title : 'Status',
                data  : 'message',
                name : 'message',
                render: null,
                orderable : false,
                searchable : false,
            },
          
            {
               
                title: "Action",
                data: 'actions',
                render: null,
                orderable: false,
                searchable: false,

            },
        ], {
            ajax    : "/ajax/page-event",
            order           : [[1, 'desc']],

        }, undefined);
       

    });})