const keyword = $('.flash-data').data('keyword');
const pesan = $('.flash-data').data('pesan');
// console.log(keyword);
// console.log(pesan);

if (keyword == 'feedbackAlert') {
    toastr.success(pesan, 'Terima kasih, ', {
      "closeButton": true,
      "debug": false,
      "newestOnTop": false,
      "progressBar": false,
      "positionClass": "toast-bottom-full-width",
      "preventDuplicates": false,
      "onclick": null,
      "showDuration": "300",
      "hideDuration": "1000",
      "timeOut": "5000",
      "extendedTimeOut": "1000",
      "showEasing": "swing",
      "hideEasing": "linear",
      "showMethod": "fadeIn",
      "hideMethod": "fadeOut"
	})
}

if (keyword == 'TambahData') {
  swal("Berhasil", pesan, {
    icon : "success",
    buttons: {        			
      confirm: {
        className : 'btn btn-success'
      }
    },
  });
}

if (keyword == 'EditData') {
  swal("Berhasil!", pesan, {
    icon : "success",
    buttons: {        			
      confirm: {
        className : 'btn btn-info'
      }
    },
  });
}

if (keyword == 'HapusData') {
  swal("Berhasil!", pesan, {
    icon : "error",
    buttons: {        			
      confirm: {
        className : 'btn btn-danger'
      }
    },
  });
}

if (keyword == 'Alert') {
  swal("Gagal!", pesan, {
    icon : "error",
    buttons: {        			
      confirm: {
        className : 'btn btn-danger'
      }
    },
  })
}
