function prosesRupiah(data, prefix) {
    var angkaString = data.toString();
    var number_string = angkaString.replace(/[^,\d]/g, "").toString();
    var split = number_string.split(",");
    var sisa = split[0].length % 3;
    var rupiah = split[0].substr(0, sisa);
    var ribuan = split[0].substr(sisa).match(/\d{3}/gi);

    // tambahkan titik jika yang di input sudah menjadi angka ribuan
    if (ribuan) {
        separator = sisa ? "." : "";
        rupiah += separator + ribuan.join(".");
    }

    rupiah = split[1] != undefined ? rupiah + "," + split[1] : rupiah;
    return prefix == undefined ? rupiah : rupiah ? rupiah : "";
}

// Versi koma
// function prosesRupiah(data, prefix){
//   var angkaString   = data.toString();
//   var number_string = angkaString.replace(/[^.\d]/g, "").toString();
//   var split         = number_string.split(".");
//   var sisa          = split[0].length % 3;
//   var rupiah        = split[0].substr(0, sisa);
//   var ribuan        = split[0].substr(sisa).match(/\d{3}/gi);

//   // tambahkan titik jika yang di input sudah menjadi angka ribuan
//   if (ribuan) {
//       separator = sisa ? "," : "";
//       rupiah += separator + ribuan.join(",");
//   }

//   rupiah = split[1] != undefined ? rupiah + "." + split[1] : rupiah;
//   return prefix == undefined ? rupiah : rupiah ? rupiah : "";
// }
