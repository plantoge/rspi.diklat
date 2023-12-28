<?php

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\FromCollection;

class exportpsempatayatdua implements FromView
{
    protected $metode;
    protected $tahun;

    function __construct($metode, $tahun) {
        $this->metode = $metode;
        $this->tahun = $tahun;
    }

    public function view(): View
    {
        if($this->metode == 'LS'){
            $metode = '=';
        }else{
            $metode = '!=';
        }

        $data = DB::table('checklist_master')
            ->join('checklist', 'checklist.id_checklist_master', '=', 'checklist_master.id')
            ->join('checklist_kwitansi', 'checklist_kwitansi.id', '=', 'checklist.id_kwitansi')
            ->join('checklist_kontrak', 'checklist_kontrak.id', '=', 'checklist_master.id_kontrak')
            ->join('spby', 'checklist.id', '=', 'spby.id_checklist')
            ->join('pasal4ayat2', 'pasal4ayat2.id_spby', '=', 'spby.id')
            ->select(
                'checklist.ada_spby', 
                'checklist.tanggal_input', 
                'checklist.nomor_checklist', 
                'checklist.kode_billing', 
                'checklist.no_spm', 
                'checklist.ntpn', 
                'checklist.ntb', 
                'checklist.kode_jenispajak', 
                'checklist.kode_jenissetoran', 
                'checklist.no_sp2d', 
                'checklist.id_efaktur',
                'checklist_master.nama_penyedia', 
                'checklist_master.npwp', 
                'pasal4ayat2.nominal_pasal4ayat2', 
                'spby.jenis_anggaran', 
                'spby.tanggal_transaksi', 
                'spby.created_at', 
                'spby.desk_pengeluaran', 
                'checklist_kwitansi.nominal_kwitansi', 
            )
            ->selectRaw('checklist.id AS id_checklist')
            ->groupByRaw('pasal4ayat2.id_spby')
            ->where('checklist.payment_by', $metode, 'LS')
            ->get();

        return view('pajak/pasal4ayat2/excel', [
            'data' => $data,
            'metode' => $this->metode,
            'tahun' => $this->tahun,
        ]);
    }
}
